# Thông báo giá chạm ngưỡng / chạm đáy

Tài liệu thiết kế trước khi code. Mục tiêu: user cài mức **vượt ngưỡng** và/hoặc **chạm đáy** trên card giá Thị trường; sau mỗi lần cron/fetch cập nhật giá, BE đánh giá alert và gửi FCM **đúng một lần mỗi lần chạm**; app có **trang Thông báo** để theo dõi các alert đã cài.

---

## 1. Mục tiêu & phạm vi

| In scope | Out of scope (phase sau) |
|----------|---------------------------|
| CRUD alert theo user + `(source_id, price_id)` | Alert theo % thay đổi trong ngày |
| Sau fetch: **giữ nguyên** `prices_patched` (topic) như hiện tại | Thay / gộp message topic với alert |
| **Thêm** hàm check bảng alert trên giá `changed` → FCM **token của đúng `user_id`** | WebSocket realtime |
| Logic “chạm 1 lần → gửi; còn trong vùng → không gửi lại; thoát vùng rồi chạm lại → gửi tiếp” | Email / SMS |
| Trang Thông báo: danh sách alert đã cài + trạng thái / lần chạm gần nhất | Inbox chat / marketing push |

### Nguyên tắc tích hợp BE (đơn giản)

Sau mỗi lần fetch có giá đổi:

1. **Như hiện tại:** `notifyPricesChanged(changed)` → topic `prices_updated` / `prices_patched` (mọi app patch local).
2. **Thêm song song:** `evaluatePriceAlerts(changed)` → đọc bảng `price_alerts` → nếu chạm ceiling/floor (và chưa latch) → `sendToTokens` với `users.fcm_tokens` của **đúng user đó**.

Không đổi payload/topic `prices_patched`. Alert là kênh FCM **riêng** (`type=price_alert`), chỉ tới thiết bị user đã cài mốc.

---

## 2. Thuật ngữ

| Thuật ngữ | Nghĩa |
|-----------|--------|
| **Ceiling / vượt ngưỡng** | Giá theo dõi **≥** `target_high` → fire |
| **Floor / chạm đáy** | Giá theo dõi **≤** `target_low` → fire |
| **Quote side** | Theo dõi cột `buy` hoặc `sell` của `prices` (mặc định đề xuất: `sell`) |
| **Armed (ngoài vùng)** | Giá chưa thỏa điều kiện → sẵn sàng fire lần tới |
| **Latched (trong vùng)** | Đã fire và giá vẫn thỏa → **không** fire lại |
| **Re-arm** | Giá thoát khỏi vùng điều kiện → trở lại Armed |

Một **alert row** có thể cấu hình một hoặc cả hai mốc (`target_high` và/hoặc `target_low`). Mỗi mốc có state latch **độc lập**.

---

## 3. Luật gửi thông báo (quan trọng)

Ví dụ ceiling `target_high = 100`:

```
Giá:  95 → 100  → 102 → 101 →  99 → 100
      │     │      │     │      │     │
      A     FIRE   latch latch  rearm FIRE
```

- **Armed → điều kiện đúng**: gửi FCM **1 lần**, chuyển **Latched**.
- **Latched + điều kiện vẫn đúng**: **không** gửi (kể cả giá dao động trong vùng).
- **Latched → điều kiện sai** (thoát vùng): **Re-arm** (không gửi).
- **Armed → điều kiện đúng lần nữa**: gửi lại.

Tương tự floor với `≤ target_low`.

### So sánh dùng giá nào?

Với mỗi alert:

```
watched = (quote_side == 'buy') ? price.buy : price.sell
```

Đánh giá:

```
ceiling_hit = target_high IS NOT NULL AND watched >= target_high
floor_hit   = target_low  IS NOT NULL AND watched <= target_low
```

### Edge khi tạo alert

Nếu lúc **create/update** giá **đã** thỏa điều kiện:

- **Option A (khuyến nghị):** khởi tạo mốc đó ở trạng thái **Latched**, **không** gửi ngay (tránh spam lúc bật alert).
- Option B: Armed và fire ngay lần cron sau — dễ gây noti tức thì.

Tài liệu này chọn **Option A**.

### Sai số float

So sánh với dung sai nhỏ (vd. `1e-6` hoặc 0.5 VND) nếu cần; mặc định so sánh số thực thẳng trên `DOUBLE PRECISION`.

---

## 4. Schema DB

Migration đề xuất: `022_price_alerts.sql`.

### 4.1. `price_alerts` — cấu hình của user

```sql
CREATE TABLE IF NOT EXISTS price_alerts (
  id              BIGSERIAL PRIMARY KEY,
  user_id         INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  source_id       INTEGER NOT NULL,
  price_id        VARCHAR(100) NOT NULL,
  quote_side      VARCHAR(10) NOT NULL DEFAULT 'sell'
                  CHECK (quote_side IN ('buy', 'sell')),
  -- Ít nhất một trong hai khác NULL (CHECK bên dưới)
  target_high     DOUBLE PRECISION,  -- vượt ngưỡng
  target_low      DOUBLE PRECISION,  -- chạm đáy
  enabled         BOOLEAN NOT NULL DEFAULT TRUE,
  -- Latch độc lập từng mốc (true = đang trong vùng, đã gửi, chờ re-arm)
  high_latched    BOOLEAN NOT NULL DEFAULT FALSE,
  low_latched     BOOLEAN NOT NULL DEFAULT FALSE,
  last_high_at    TIMESTAMPTZ,
  last_low_at     TIMESTAMPTZ,
  last_watched    DOUBLE PRECISION,  -- giá lần đánh giá gần nhất (debug/UI)
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  CONSTRAINT price_alerts_price_fk
    FOREIGN KEY (source_id, price_id)
    REFERENCES prices(source_id, id) ON DELETE CASCADE,

  CONSTRAINT price_alerts_targets_chk
    CHECK (target_high IS NOT NULL OR target_low IS NOT NULL),

  CONSTRAINT price_alerts_high_low_order_chk
    CHECK (
      target_high IS NULL
      OR target_low IS NULL
      OR target_high > target_low
    ),

  -- Một user + một mã giá + một quote_side → một row (upsert dễ)
  CONSTRAINT price_alerts_user_price_side_uq
    UNIQUE (user_id, source_id, price_id, quote_side)
);

CREATE INDEX IF NOT EXISTS price_alerts_enabled_price_idx
  ON price_alerts (source_id, price_id)
  WHERE enabled = TRUE;

CREATE INDEX IF NOT EXISTS price_alerts_user_idx
  ON price_alerts (user_id);
```

### 4.2. `price_alert_events` — lịch sử lần chạm (optional nhưng nên có)

Phục vụ trang Thông báo (timeline) và debug; không dùng để quyết định latch (latch nằm trên `price_alerts`).

```sql
CREATE TABLE IF NOT EXISTS price_alert_events (
  id           BIGSERIAL PRIMARY KEY,
  alert_id     BIGINT NOT NULL REFERENCES price_alerts(id) ON DELETE CASCADE,
  user_id      INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  source_id    INTEGER NOT NULL,
  price_id     VARCHAR(100) NOT NULL,
  kind         VARCHAR(16) NOT NULL CHECK (kind IN ('ceiling', 'floor')),
  target       DOUBLE PRECISION NOT NULL,
  watched      DOUBLE PRECISION NOT NULL,
  quote_side   VARCHAR(10) NOT NULL,
  fcm_success  BOOLEAN,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS price_alert_events_user_created_idx
  ON price_alert_events (user_id, created_at DESC);
```

---

## 5. Backend — API

Base: `/api/v1/price-alerts` (JWT bắt buộc, chỉ thao tác alert của chính user).

### 5.1. `GET /price-alerts`

Query optional: `source_id`, `price_id`, `enabled`.

Response item (join `prices` để hiện tên):

```json
{
  "id": 1,
  "source_id": 10,
  "price_id": "PQ-999",
  "price_name": "Nhẫn 9999",
  "price_type": "gold",
  "quote_side": "sell",
  "target_high": 85000000,
  "target_low": 78000000,
  "enabled": true,
  "high_latched": false,
  "low_latched": true,
  "last_high_at": null,
  "last_low_at": "2026-09-09T04:12:01.000Z",
  "last_watched": 77950000,
  "current_buy": 77500000,
  "current_sell": 77950000,
  "created_at": "...",
  "updated_at": "..."
}
```

### 5.2. `POST /price-alerts`

Body:

```json
{
  "source_id": 10,
  "price_id": "PQ-999",
  "quote_side": "sell",
  "target_high": 85000000,
  "target_low": 78000000
}
```

- Validate: tồn tại `prices`; ít nhất một target; `high > low` nếu cả hai có.
- Upsert theo `(user_id, source_id, price_id, quote_side)`.
- Init latch theo Option A (đọc giá hiện tại).

### 5.3. `PATCH /price-alerts/:id`

Cho phép sửa `target_high`, `target_low`, `quote_side`, `enabled`.

Khi đổi target / quote_side → **tính lại latch** từ giá hiện tại (Option A), không fire ngay.

### 5.4. `DELETE /price-alerts/:id`

Xóa alert (+ cascade events).

### 5.5. `GET /price-alerts/events` (trang Thông báo – tab lịch sử)

Query: `limit` (default 50), `cursor` / `before`.

Trả về các lần đã fire (join tên giá).

---

## 6. Backend — đánh giá sau fetch giá

### 6.1. Hook vào luồng hiện có (không đụng `prices_patched`)

Trong `priceFetchService`, chỗ đã có `notifyPricesChanged(imported.changed)` / `notifyPricesChanged(changedAcc)`:

```
notifyPricesChanged(changed);     // GIỮ NGUYÊN — topic prices_patched
evaluatePriceAlerts(changed);     // THÊM — check bảng alert → FCM theo user token
```

Cả hai đều fire-and-forget (`setImmediate`), **không** làm fail fetch.

`evaluatePriceAlerts` chỉ cần nhận list `changed` dạng `{ i, sid, b, sl, ... }` (cùng `toChangedPriceItem`).

### 6.2. Hàm `evaluatePriceAlerts(changedItems)` — việc duy nhất cần thêm ở cron path

```
for each changed price P:
  alerts = SELECT * FROM price_alerts
           WHERE enabled AND source_id = P.sid AND price_id = P.i
  for each alert A:
    watched = A.quote_side == 'buy' ? P.b : P.sl
    // Ceiling
    if A.target_high != null:
      inHigh = watched >= A.target_high
      if inHigh && !A.high_latched:
        fire(A, 'ceiling', watched)      // gửi noti cho A.user_id
        A.high_latched = true; A.last_high_at = now
      else if !inHigh && A.high_latched:
        A.high_latched = false           // re-arm, không gửi
    // Floor — tương tự target_low / low_latched
    A.last_watched = watched
    UPDATE alert
```

`fire(A, kind, watched)`:

1. (Optional) Insert `price_alert_events`.
2. Lấy `fcm_tokens` của `A.user_id` (như `test-push`).
3. Nếu không có token → ghi log / `fcm_success=false`, xong.
4. `sendToTokens({ tokens, title, body, data: { type: 'price_alert', ... } })`.

Payload data gợi ý:

```json
{
  "type": "price_alert",
  "kind": "ceiling" | "floor",
  "alert_id": "1",
  "source_id": "10",
  "price_id": "PQ-999",
  "price_name": "Nhẫn 9999",
  "quote_side": "sell",
  "target": "85000000",
  "watched": "85120000",
  "at": "<ISO>"
}
```

Title/body ví dụ:

- Ceiling: `Nhẫn 9999 đã vượt ngưỡng` / `Giá bán 85.120.000 ≥ 85.000.000`
- Floor: `Nhẫn 9999 đã chạm đáy` / `Giá bán 77.900.000 ≤ 78.000.000`

**Không** gửi alert qua topic `prices_updated` — chỉ token của user đó.

### 6.3. Idempotency / race

- `UPDATE ... SET high_latched = TRUE WHERE id = $1 AND high_latched = FALSE RETURNING *` — chỉ `sendToTokens` nếu `RETURNING` có row.

Tránh double-send khi hai fetch chồng nhau.

---

## 7. Flutter — UX

### 7.1. Entry từ card giá (Thị trường)

Trên `MarketPriceCard` / sheet chi tiết (`watchlist_detail_sheet`):

- Action **“Thông báo giá”** / icon chuông.
- Bottom sheet **PriceAlertSheet**:
  - Chọn theo dõi **Giá bán** / **Giá mua** (`quote_side`).
  - Input **Vượt ngưỡng** (`target_high`) — optional.
  - Input **Chạm đáy** (`target_low`) — optional.
  - Toggle bật/tắt.
  - Hiển thị giá hiện tại làm gợi ý.
  - Lưu → `POST`/`PATCH`.

Validation client khớp BE (`high > low` nếu cả hai).

### 7.2. Trang Thông báo

Route mới (vd. `Routes.notifications` / từ Settings hoặc icon chuông trên Home header):

**Tab 1 — Đang theo dõi** (`GET /price-alerts`)

- List card: tên giá, nguồn, quote side, 2 mốc, giá hiện tại, trạng thái (Armed / Đang trong vùng ngưỡng / Đang trong vùng đáy), `last_*_at`.
- Swipe/xóa, tap → sửa sheet, toggle enabled.

**Tab 2 — Lịch sử chạm** (`GET /price-alerts/events`)

- Timeline các lần đã gửi noti.
- Tap → mở chi tiết giá (reuse watchlist detail nếu có).

### 7.3. Nhận FCM `type=price_alert`

Trong `PushNotificationService._onForegroundMessage`:

- Không đi path `prices_patched`.
- Hiện local notification (title/body từ FCM).
- Optional: refresh list trang Thông báo qua bus nhỏ `PriceAlertBus` (tương tự `PriceUpdateBus`).

Background/terminated: hệ thống hiện banner (có `notification` payload); tap → deep link tới trang Thông báo hoặc detail giá (`alert_id` / `price_id` trong data).

### 7.4. Tầng code app (gợi ý)

```
lib/data/models/.../price_alert_*.dart
lib/data/data_source/remote/price_alert/...
lib/domain/repositories + usecases
lib/presentations/modules/notifications/
  notifications_screen.dart
  cubit/
  components/alert_card.dart, alert_history_tile.dart
lib/presentations/modules/market/components/price_alert_sheet.dart
```

Local SQLite cache alerts: **optional** phase 1 có thể chỉ remote + pull-to-refresh.

---

## 8. Luồng end-to-end

```
[User] Sheet cài ngưỡng/đáy trên card giá
   → POST /price-alerts (latch init Option A)
   → Hiện trên trang Thông báo / Đang theo dõi

[Cron/fetch] Giá nguồn đổi
   → importPrices → changed[]
   → notifyPricesChanged(changed)     // NHƯ CŨ — topic prices_patched
   → evaluatePriceAlerts(changed)     // MỚI — bảng alert → token user
       → cross + !latched → sendToTokens(user.fcm_tokens) + latch
       → still in zone → no-op
       → leave zone → re-arm

[Device]
   → prices_patched: mọi máy subscribe topic → patch giá local
   → price_alert: chỉ máy của user đó → banner / trang Thông báo
```
---

## 9. Bảo mật & giới hạn

- Mọi API scoped `req.user.id`.
- Rate limit: tối đa N alert / user (vd. 50) để tránh abuse.
- FCM: dọn `invalidTokens` như `testPush`.
- Không lộ token thiết bị trên API response.

---

## 10. Kế hoạch triển khai (phases)

### Phase 1 — BE core
1. Migration `022_price_alerts.sql` (+ events).
2. `priceAlertService` + controller + routes.
3. Hook `evaluatePriceAlerts` sau `changed` trong `priceFetchService`.
4. Cập nhật `backend/API_DOCUMENTATION.md`.

### Phase 2 — App cấu hình
1. Remote DS + usecase CRUD.
2. `PriceAlertSheet` từ market card / detail.
3. DI + error toast.

### Phase 3 — Trang Thông báo
1. Screen 2 tab (Đang theo dõi / Lịch sử).
2. Entry navigation (Home/Settings).
3. FCM handler `price_alert` + optional deep link.

### Phase 4 — Hardening
1. Row-lock / `UPDATE … RETURNING` chống double fire.
2. Unit test luật latch (bảng giá giả).
3. Empty states, offline error.

---

## 11. Test plan (checklist)

- [ ] Tạo alert ceiling khi giá đang dưới ngưỡng → Armed; tăng ≥ high → đúng 1 noti; giá còn cao → không noti thêm.
- [ ] Giảm xuống dưới high → không noti; tăng lại ≥ high → noti lần 2.
- [ ] Floor đối xứng.
- [ ] Cả high + low trên một alert: fire độc lập, latch độc lập.
- [ ] Create khi giá đã ≥ high → không noti ngay, `high_latched=true`.
- [ ] `enabled=false` → không evaluate.
- [ ] User A không thấy / sửa alert user B.
- [ ] Xóa giá / nguồn (CASCADE) → alert biến mất.
- [ ] Không có FCM token → event vẫn ghi, `fcm_success=false`, fetch không crash.
- [ ] App: list trang Thông báo khớp API; sheet lưu/sửa/xóa OK.
- [ ] FCM foreground `type=price_alert` hiện local noti, không nhầm `prices_patched`.

---

## 12. Quyết định mở (cần chốt trước/ khi code)

| # | Câu hỏi | Đề xuất mặc định |
|---|---------|------------------|
| 1 | Mặc định theo dõi buy hay sell? | `sell` |
| 2 | Tạo lúc đã trong vùng có gửi ngay? | Không (Option A – latch) |
| 3 | Một row cả 2 mốc hay 2 row tách? | **Một row** hai cột optional |
| 4 | Trang Thông báo có tab lịch sử? | Có (`price_alert_events`) |
| 5 | Khi app nền, có hiện banner “Cập nhật giá alert”? | Có (notification + data) |
| 6 | Custom asset local (không có trên BE)? | Phase 1: **không hỗ trợ** — chỉ giá sync từ nguồn |

---

## 13. Liên quan code hiện có

| Thành phần | Tái sử dụng |
|------------|-------------|
| `prices` PK `(source_id, id)` | FK alert |
| `users.fcm_tokens` | `sendToTokens` khi fire alert |
| `fcmService.sendPricesPatched` | **Giữ nguyên** — topic sau fetch |
| `fcmService.sendToTokens` | Chỉ dùng cho `type=price_alert` |
| `priceFetchService` `changed` | Input chung: topic + `evaluatePriceAlerts` |
| `PushNotificationService` | Branch `type=price_alert` (riêng với `prices_patched`) |
| Market card / watchlist detail | Entry cài alert |
| Settings / Home header | Entry trang Thông báo |

---

*Tài liệu này là contract triển khai. Khi bắt đầu code, giữ Phase 1 → 2 → 3; mọi lệch so với mục 12 cần cập nhật lại file này.*
