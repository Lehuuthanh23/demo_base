# VB Index API — Tài liệu Backend

Tài liệu mô tả toàn bộ API, request/response, schema DB và luồng hoạt động của source `vbindex_api`.

- **Stack:** Node.js (Express 5) + PostgreSQL (`pg`) + Axios + Multer + node-cron
- **Base URL (local):** `http://localhost:4001` (hoặc `PORT` trong `.env`)
- **API prefix:** `/api/v1`
- **Content-Type hỗ trợ:** `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
- **Auth:** JWT access + refresh token, role `admin` \| `user`, WebAuthn/Passkey (Face ID, Touch ID)
---

## Mục lục

1. [Tổng quan hệ thống](#1-tổng-quan-hệ-thống)
2. [Cấu trúc thư mục](#2-cấu-trúc-thư-mục)
3. [Khởi động & cấu hình](#3-khởi-động--cấu-hình)
4. [Schema database](#4-schema-database)
5. [Format response chung](#5-format-response-chung)
6. [API Endpoints](#6-api-endpoints)
7. [Luồng hoạt động chi tiết](#7-luồng-hoạt-động-chi-tiết)
8. [Cron job](#8-cron-job)
9. [Upload ảnh](#9-upload-ảnh)
10. [Mã lỗi thường gặp](#10-mã-lỗi-thường-gặp)

---

## 1. Tổng quan hệ thống

Hệ thống quản lý **nguồn giá** (`price_sources`) và **giá** (`prices`) — thường dùng cho vàng/bạc/kim loại quý.

```text
┌─────────────┐     HTTP      ┌──────────────────┐     SQL      ┌────────────┐
│  Admin / FE │ ────────────► │  Express API     │ ───────────► │ PostgreSQL │
└─────────────┘               │  /api/v1/...     │              └────────────┘
                              └────────┬─────────┘
                                       │ GET (Axios)
                                       ▼
                              ┌──────────────────┐
                              │  API nguồn ngoài │
                              │  (SJC, Kitco…)   │
                              └──────────────────┘
                                       │
                              Cron mỗi ~25 phút
                              gọi fetchAll()
```

**Hai nhóm chức năng chính:**

| Nhóm | Prefix | Vai trò |
|------|--------|---------|
| Auth | `/api/v1/auth` | Đăng ký, đăng nhập, refresh/logout, WebAuthn passkey |
| Price Sources | `/api/v1/price-sources` | CRUD nguồn + fetch giá từ API ngoài |
| Prices | `/api/v1/prices` | List / lịch sử / tạo / sửa / xóa / bật-tắt giá |
| Crawl | `/api/v1/crawlPrices` | Crawl HTML/API nguồn (DOJI, BTMH, Ancarat…) |

---

## 2. Cấu trúc thư mục

```text
vbindex_api/
├── server.js                      # Entry: connect DB → listen → start cron
├── src/
│   ├── app.js                     # Express: CORS, multipart, routes, static
│   ├── config/db.js               # Pool PostgreSQL
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── priceSourceRoutes.js
│   │   ├── pricesRoutes.js
│   │   └── crawlPricesRoutes.js
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── priceSourceController.js
│   │   ├── pricesController.js
│   │   └── crawlPricesController.js
│   ├── services/
│   │   ├── authService.js
│   │   ├── priceFetchService.js
│   │   └── webauthnService.js
│   ├── middleware/
│   │   ├── auth.js
│   │   └── parseMultipart.js
├── db/
│   ├── migrate.js
│   └── migrations/                # 001 → 009
└── storages/uploads/prices/       # Ảnh giá (static: /uploads/prices)
```

---

## 3. Khởi động & cấu hình

### Biến môi trường (`.env`)

| Biến | Mặc định | Mô tả |
|------|----------|--------|
| `PORT` | `4000` | Cổng HTTP |
| `DATABASE_URL` | — | Connection string PostgreSQL (bắt buộc) |
| `FETCH_ALL_CRON` | `*/25 * * * *` | Cron expression fetch tất cả nguồn |
| `JWT_SECRET` | — | Secret ký JWT (**bắt buộc** khi dùng auth) |
| `JWT_ACCESS_EXPIRES_IN` | `1h` | Thời hạn access token (`15m`, `1h`, `1d`…) |
| `JWT_REFRESH_EXPIRES_DAYS` | `30` | Số ngày hết hạn refresh token |
| `WEBAUTHN_RP_NAME` | `VB Index` | Tên hiển thị khi đăng ký passkey |
| `WEBAUTHN_RP_ID` | `localhost` | Relying Party ID (domain, không port) |
| `WEBAUTHN_ORIGIN` | `http://localhost:4001` | Origin FE (phải khớp URL trình duyệt) |

### Scripts

| Lệnh | Mô tả |
|------|--------|
| `npm run m:up` | Chạy migration SQL |
| `npm run dev` | Dev (nodemon) |
| `npm start` | Production |

### Boot sequence

1. Load `.env`
2. `db.connect()` — fail → exit
3. `app.listen(PORT)`
4. `startCronJobs()` — lên lịch `fetchAll`
5. SIGINT/SIGTERM → đóng pool + server

### Health check

```http
GET /
```

**Response `200`:**

```json
{ "message": "Server đang chạy bình thường!" }
```

---

## 4. Schema database

### 4.1. `price_sources`

Nguồn giá bên ngoài (URL API + mapping field).

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `id` | SERIAL PK | Id nguồn |
| `name` | VARCHAR | Tên nguồn |
| `api` | TEXT | URL API ngoài (GET) |
| `key` | VARCHAR | Path lấy list trong JSON (vd: `data`, `data/gold/items`). Rỗng = dùng cả body |
| `type` | VARCHAR | Loại giá (gán cho mỗi price khi import) |
| `currency` | VARCHAR | Đơn vị tiền |
| `diff_mode` | VARCHAR | `vnd` (cộng tuyệt đối) hoặc `percent` / `pct` / `%` |
| `buy_adjust` | DOUBLE | Điều chỉnh giá mua (copy xuống price khi import) |
| `sell_adjust` | DOUBLE | Điều chỉnh giá bán |
| `price_formula` | TEXT | Công thức (lưu kèm; hiện import chưa evaluate runtime) |
| `field_id` | VARCHAR | Tên field id trong JSON nguồn. Rỗng → dùng object key |
| `field_name` | VARCHAR | Map field tên (default `name`) |
| `field_buy` | VARCHAR | Map field mua (default `buy`) |
| `field_sell` | VARCHAR | Map field bán (default `sell`) |
| `field_change_buy` | VARCHAR | Map biến động mua |
| `field_change_sell` | VARCHAR | Map biến động bán |
| `last_inserted` | INTEGER | Số bản ghi insert lần fetch gần nhất |
| `last_updated` | INTEGER | Số bản ghi update lần fetch gần nhất |
| `last_fetched_at` | TIMESTAMPTZ | Thời điểm fetch gần nhất |
| `disabled` | BOOLEAN | `true` = bỏ qua khi list/fetch-all/cron |
| `created_at` / `updated_at` | TIMESTAMPTZ | |

**Unique:** `(name, api, type)`

### 4.2. `prices`

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `source_id` | INTEGER NOT NULL | FK → `price_sources.id` ON DELETE CASCADE |
| `id` | VARCHAR(100) | Id giá (thường dạng `{externalId}-{sourceId}`) |
| — | **PK composite** | `(source_id, id)` |
| `name` | VARCHAR | Tên hiển thị |
| `type` | VARCHAR | Loại |
| `buy` / `sell` | DOUBLE | Giá mua / bán |
| `change_buy` / `change_sell` | DOUBLE | Biến động so với lần trước |
| `currency` | VARCHAR | Đơn vị |
| `image` | VARCHAR | Path public ảnh (`/uploads/prices/...`) |
| `is_active` | BOOLEAN | Bật/tắt hiển thị |
| `diff_mode` | VARCHAR | Mode điều chỉnh khi là giá phụ thuộc (`ref_id`) |
| `buy_adjust` / `sell_adjust` | DOUBLE | Offset/% so với giá gốc |
| `price_formula` | TEXT | Công thức |
| `ref_id` | VARCHAR | Id giá gốc để sync (cùng hoặc khác source) |
| `created_at` / `updated_at` | TIMESTAMPTZ | |

### 4.3. `price_history`

Mỗi lần giá thay đổi (fetch/import/sync ref) → **một dòng mới** (cho phép nhiều dòng cùng ngày — migration 009).

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `id` | BIGSERIAL PK | |
| `source_id` | INTEGER | Cùng composite FK |
| `price_id` | VARCHAR | |
| `price_date` | DATE | Thường `CURRENT_DATE` |
| `buy` / `sell` / `change_*` / `currency` | | Snapshot tại thời điểm ghi |
| `created_at` / `updated_at` | TIMESTAMPTZ | |

**FK:** `(source_id, price_id)` → `prices(source_id, id)` ON DELETE CASCADE

### 4.4. `users`

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `id` | SERIAL PK | |
| `name` | VARCHAR(100) | Tên hiển thị |
| `username` | VARCHAR(100) UNIQUE | Tên đăng nhập |
| `password_hash` | TEXT | bcrypt hash (không trả API) |
| `role` | VARCHAR(20) | `admin` hoặc `user` (đăng ký mặc định `user`) |
| `created_at` / `updated_at` | TIMESTAMPTZ | |

### 4.5. `refresh_tokens`

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `id` | BIGSERIAL PK | |
| `user_id` | INTEGER FK → `users` | |
| `token_hash` | TEXT | SHA-256 của refresh token (không lưu plain text) |
| `expires_at` | TIMESTAMPTZ | Hết hạn |
| `revoked_at` | TIMESTAMPTZ | Logout / rotation → set thời điểm thu hồi |
| `created_at` | TIMESTAMPTZ | |

### 4.6. `webauthn_credentials`

Lưu **public key** passkey (Face ID / Touch ID / Windows Hello). **Không** lưu dữ liệu sinh trắc học thô.

| Cột | Kiểu | Mô tả |
|-----|------|--------|
| `id` | BIGSERIAL PK | |
| `user_id` | INTEGER FK → `users` | |
| `credential_id` | TEXT UNIQUE | Id credential từ authenticator |
| `public_key` | BYTEA | Public key |
| `counter` | BIGINT | Chống replay |
| `device_type` | VARCHAR(50) | `singleDevice` / `multiDevice` |
| `backed_up` | BOOLEAN | Passkey có backup cloud |
| `transports` | TEXT[] | `internal`, `hybrid`, … |
| `created_at` | TIMESTAMPTZ | |

### 4.7. `webauthn_challenges`

Challenge tạm (TTL ~5 phút) cho luồng WebAuthn.

---

## 5. Format response chung

### Thành công

```json
{
  "success": true,
  "data": { }
}
```

Hoặc với list:

```json
{
  "success": true,
  "data": [ ]
}
```

### Lỗi

```json
{
  "success": false,
  "message": "Mô tả lỗi tiếng Việt"
}
```

| HTTP | Ý nghĩa |
|------|---------|
| `400` | Validation / tham số sai / nguồn disabled |
| `404` | Không tìm thấy |
| `409` | Trùng unique (name+api+type hoặc id giá trong nguồn) |
| `500` | Lỗi server / DB |
| `502` | Gọi API nguồn ngoài thất bại |

---

## 6. API Endpoints

### Bảng tổng hợp

| Method | Path | Mô tả |
|--------|------|--------|
| `GET` | `/` | Health check |
| `POST` | `/api/v1/auth/register` | Đăng ký user |
| `POST` | `/api/v1/auth/login` | Đăng nhập password |
| `POST` | `/api/v1/auth/refresh` | Refresh access token |
| `POST` | `/api/v1/auth/logout` | Thu hồi refresh token |
| `POST` | `/api/v1/auth/webauthn/register/options` | Challenge đăng ký passkey (Bearer) |
| `POST` | `/api/v1/auth/webauthn/register/verify` | Hoàn tất đăng ký passkey (Bearer) |
| `POST` | `/api/v1/auth/webauthn/login/options` | Challenge đăng nhập passkey |
| `POST` | `/api/v1/auth/webauthn/login/verify` | Đăng nhập passkey → token |
| `GET` | `/api/v1/price-sources` | Danh sách nguồn (`disabled`, `all`) |
| `POST` | `/api/v1/price-sources` | Tạo nguồn |
| `PATCH` | `/api/v1/price-sources/:id` | Cập nhật nguồn (partial) |
| `PATCH` | `/api/v1/price-sources/:id/disable` | Bật/tắt nguồn |
| `DELETE` | `/api/v1/price-sources/:id` | Xóa nguồn (+ cascade prices) |
| `POST` | `/api/v1/price-sources/:id/fetch` | Fetch + import 1 nguồn |
| `POST` | `/api/v1/price-sources/fetch-all` | Fetch + import tất cả nguồn active |
| `GET` | `/api/v1/prices` | Danh sách giá (`is_active`, `source_id`) |
| `GET` | `/api/v1/prices/history` | Lịch sử giá theo `price_id` + `days` |
| `POST` | `/api/v1/prices` | Tạo giá thủ công |
| `PATCH` | `/api/v1/prices/:sourceId/:id` | Cập nhật giá (partial) |
| `PATCH` | `/api/v1/prices/:sourceId/:id/disable` | Bật/tắt giá |
| `DELETE` | `/api/v1/prices/:sourceId/:id` | Xóa giá |
| `GET` | `/uploads/prices/:filename` | Static file ảnh |

---

### 6.0. Auth

Prefix: `/api/v1/auth`

**Luồng password:** `register` hoặc `login` → nhận `accessToken` + `refreshToken` → gọi API kèm header `Authorization: Bearer <accessToken>` → hết hạn thì `refresh` → `logout` thu hồi refresh token.

**Luồng passkey (WebAuthn):**

1. Đăng nhập password lần đầu.
2. `POST /webauthn/register/options` + `register/verify` (Bearer) — đăng ký Face ID/Touch ID.
3. Lần sau: `POST /webauthn/login/options` → trình duyệt gọi `navigator.credentials.get()` → `POST /webauthn/login/verify` → token.

Server **chỉ lưu public key**, không lưu vân tay/khuôn mặt.

#### `POST /api/v1/auth/register`

**Body:**

```json
{
  "username": "demo_user",
  "password": "secret123",
  "name": "Demo User"
}
```

| Field | Bắt buộc | Mô tả |
|-------|----------|--------|
| `username` | Có | 3–50 ký tự, `[a-zA-Z0-9_]` |
| `password` | Có | Tối thiểu 6 ký tự |
| `name` | Không | Tên hiển thị (mặc định = username) |

Role luôn là `user` khi đăng ký qua API.

**Admin mặc định (tạo khi `npm run m:up`, migration `013`):**

| Field | Giá trị |
|-------|---------|
| `username` | `admin` |
| `password` | `Admin@123456` |
| `role` | `admin` |

Nếu `admin` đã tồn tại thì migration bỏ qua (không reset password). Nên đổi mật khẩu sau deploy production.

**Response `201`:**

```json
{
  "success": true,
  "data": {
    "accessToken": "eyJ...",
    "refreshToken": "...",
    "expiresIn": 3600,
    "user": {
      "id": 1,
      "username": "demo_user",
      "name": "Demo User",
      "role": "user",
      "created_at": "...",
      "updated_at": "..."
    }
  }
}
```

#### `POST /api/v1/auth/login`

**Body:** `{ "username": "demo_user", "password": "secret123" }`

**Response `200`:** Cùng format token như register.

#### `POST /api/v1/auth/refresh`

**Body:** `{ "refreshToken": "..." }`

Trả access + refresh token **mới**; refresh token cũ bị revoke (rotation).

#### `POST /api/v1/auth/logout`

**Body:** `{ "refreshToken": "..." }`

Revoke refresh token — không dùng lại được.

**Response `200`:**

```json
{
  "success": true,
  "data": { "loggedOut": true }
}
```

#### `POST /api/v1/auth/webauthn/register/options`

**Header:** `Authorization: Bearer <accessToken>`

Trả `PublicKeyCredentialCreationOptions` cho `@simplewebauthn/browser` hoặc Web API native.

#### `POST /api/v1/auth/webauthn/register/verify`

**Header:** `Authorization: Bearer <accessToken>`

**Body:** JSON response từ `navigator.credentials.create()`.

#### `POST /api/v1/auth/webauthn/login/options`

**Body:** `{ "username": "demo_user" }`

#### `POST /api/v1/auth/webauthn/login/verify`

**Body:**

```json
{
  "username": "demo_user",
  "assertion": { "...": "PublicKeyCredential JSON từ navigator.credentials.get()" }
}
```

**Response `200`:** Cùng format token như login password.

**Lỗi auth thường gặp:** `401` sai credential/token, `409` username trùng, `403` thiếu quyền role.

---

### 6.1. Price Sources

#### `GET /api/v1/price-sources`

Lấy danh sách nguồn, sắp xếp `id ASC`.

**Query:**

| Param | Mặc định | Mô tả |
|-------|----------|--------|
| `disabled` | `false` | `false` = chỉ nguồn đang bật; `true` = chỉ nguồn đã ẩn (disabled) |
| `all` | — | `true` = lấy **tất cả** (bỏ lọc `disabled`) |

**Ví dụ:**

```http
GET /api/v1/price-sources
GET /api/v1/price-sources?disabled=false
GET /api/v1/price-sources?disabled=true
GET /api/v1/price-sources?all=true
```

**Response `200`:**

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "SJC",
      "api": "https://example.com/prices.json",
      "key": "data",
      "type": "gold",
      "currency": "VND",
      "diff_mode": "vnd",
      "buy_adjust": 0,
      "sell_adjust": 0,
      "price_formula": "",
      "field_id": "code",
      "field_name": "name",
      "field_buy": "buy",
      "field_sell": "sell",
      "field_change_buy": "change_buy",
      "field_change_sell": "change_sell",
      "last_inserted": 2,
      "last_updated": 5,
      "last_fetched_at": "2026-08-27T07:00:00.000Z",
      "disabled": false,
      "created_at": "...",
      "updated_at": "..."
    }
  ]
}
```

---

#### `POST /api/v1/price-sources`

Tạo nguồn mới.

**Body (JSON hoặc form):**

| Field | Bắt buộc | Mô tả |
|-------|----------|--------|
| `source_name` hoặc `name` | **Có** | Tên nguồn |
| `api` | Không | URL API |
| `key` | Không | Key lấy list trong JSON |
| `type` | Không | Loại |
| `currency` | Không | Đơn vị |
| `diff_mode` | Không | `vnd` / `percent` |
| `buy_adjust` | Không | |
| `sell_adjust` | Không | |
| `price_formula` | Không | |
| `disabled` | Không | |
| `field_id` | Không | |
| `field_name` | Không | |
| `field_buy` | Không | |
| `field_sell` | Không | |
| `field_change_buy` | Không | |
| `field_change_sell` | Không | |

**Ví dụ request:**

```json
{
  "source_name": "Kitco Gold",
  "api": "https://example.com/api/gold",
  "key": "",
  "type": "gold",
  "currency": "USD",
  "field_id": "symbol",
  "field_name": "title",
  "field_buy": "bid",
  "field_sell": "ask"
}
```

**Response `201`:** `{ "success": true, "data": { /* source row */ } }`

**Lỗi:**

- `400` — thiếu tên
- `409` — trùng `(name, api, type)`

---

#### `PATCH /api/v1/price-sources/:id`

Cập nhật **partial** — chỉ field gửi lên mới đổi.

**Params:** `id` — số nguyên > 0

**Body:** bất kỳ field nào giống create (`source_name`/`name`, `api`, `key`, `type`, `currency`, `diff_mode`, `buy_adjust`, `sell_adjust`, `price_formula`, `disabled`, `field_*`)

**Response `200`:** `{ "success": true, "data": { /* source đã cập nhật */ } }`

**Lỗi:**

- `400` — id sai / không có field nào / tên rỗng
- `404` — không tìm thấy
- `409` — trùng unique

---

#### `PATCH /api/v1/price-sources/:id/disable`

Bật/tắt nguồn.

**Body:**

```json
{ "disabled": true }
```

- Không gửi `disabled` → mặc định `true` (disable)

**Response `200`:** `{ "success": true, "data": { /* source */ } }`

---

#### `DELETE /api/v1/price-sources/:id`

Xóa nguồn. Cascades xóa `prices` và `price_history` liên quan.

**Response `200`:** `{ "success": true, "data": { /* source đã xóa */ } }`

---

#### `POST /api/v1/price-sources/:id/fetch`

Fetch API ngoài của **một** nguồn → parse → upsert `prices` → ghi `price_history` → sync giá `ref_id`.

**Params:** `id` nguồn

**Body:** không cần

**Response `200`:**

```json
{
  "success": true,
  "data": {
    "source": { /* full source row */ },
    "status": 200,
    "data": [
      {
        "id": "XAUUSD-1",
        "name": "Gold",
        "buy": 2650.5,
        "sell": 2652.0,
        "change_buy": 0,
        "change_sell": 0,
        "currency": "USD",
        "type": "gold"
      }
    ],
    "imported": {
      "inserted": 1,
      "updated": 3,
      "total": 4,
      "prices": [ /* rows từ bảng prices */ ]
    }
  }
}
```

**Lỗi:**

- `400` — id sai / nguồn disabled / thiếu URL API
- `404` — không tìm thấy nguồn
- `502` — upstream lỗi / timeout

---

#### `POST /api/v1/price-sources/fetch-all`

Fetch lần lượt **mọi** nguồn `disabled = false`. Lỗi từng nguồn **không** làm fail toàn bộ.

**Response `200`:**

```json
{
  "success": true,
  "data": {
    "total": 3,
    "success": 2,
    "failed": 1,
    "results": [
      {
        "success": true,
        "sourceId": 1,
        "sourceName": "SJC",
        "status": 200,
        "data": [ /* parsed list */ ],
        "imported": { "inserted": 0, "updated": 5, "total": 5, "prices": [] }
      },
      {
        "success": false,
        "sourceId": 2,
        "sourceName": "Broken",
        "status": 502,
        "message": "Không gọi được API nguồn: ...",
        "url": "https://..."
      }
    ]
  }
}
```

---

### 6.2. Prices

#### `GET /api/v1/prices`

Danh sách giá.

**Query:**

| Param | Bắt buộc | Mặc định | Mô tả |
|-------|----------|----------|--------|
| `is_active` | Không | `true` | Lọc theo trạng thái |
| `source_id` | Không | — | Nếu có thì lọc theo nguồn; không truyền thì lấy mọi nguồn |

**Ví dụ:**

```http
GET /api/v1/prices
GET /api/v1/prices?source_id=5
GET /api/v1/prices?is_active=false&source_id=5
```

**Response `200`:**

```json
{
  "success": true,
  "data": [
    {
      "id": "BPQ10L-5",
      "source_id": 5,
      "name": "Bạc thỏi Phú Quý 999 10 lượng",
      "type": "gold",
      "buy": 22950000,
      "sell": 23660000,
      "change_buy": -50000,
      "change_sell": -50000,
      "currency": "VND",
      "image": "",
      "is_active": true,
      "diff_mode": "vnd",
      "buy_adjust": 0,
      "sell_adjust": 0,
      "price_formula": null,
      "ref_id": null,
      "created_at": "...",
      "updated_at": "..."
    }
  ]
}
```

Sắp xếp: `source_id ASC`, `name ASC`.

---

#### `GET /api/v1/prices/history`

Lịch sử giá theo `price_id` trong N ngày gần nhất.

**Query:**

| Param | Bắt buộc | Mặc định | Mô tả |
|-------|----------|----------|--------|
| `price_id` | **Có** | — | Id giá trong DB (vd `BPQ10L-5`) |
| `source_id` | Không | — | Nên truyền để tránh trùng id giữa nguồn |
| `days` | Không | `1` | Số ngày (1–365). `10` = 10 ngày gần nhất (gồm hôm nay) |
| `detail` | Không | `false` | `true` = mọi bản ghi trong ngày (log); `false` = chỉ **bản ghi cuối mỗi ngày** (thống kê) |

**Ví dụ:**

```http
# Thống kê 10 ngày — 1 điểm/ngày
GET /api/v1/prices/history?price_id=BPQ10L-5&source_id=5&days=10

# Log chi tiết trong 1 ngày
GET /api/v1/prices/history?price_id=BPQ10L-5&source_id=5&days=1&detail=true

# 10 ngày + full log từng ngày
GET /api/v1/prices/history?price_id=BPQ10L-5&source_id=5&days=10&detail=true
```

**Response `200`:**

```json
{
  "success": true,
  "data": {
    "price_id": "BPQ10L-5",
    "source_id": 5,
    "days": 10,
    "detail": false,
    "items": [
      {
        "id": 245,
        "source_id": 5,
        "price_id": "BPQ10L-5",
        "price_date": "2026-08-27",
        "buy": 23160000,
        "sell": 23880000,
        "change_buy": -20000,
        "change_sell": -20000,
        "currency": "VND",
        "created_at": "2026-08-27T04:59:09.965Z",
        "updated_at": "2026-08-27T04:59:09.965Z"
      }
    ]
  }
}
```

- `items` sắp **tăng dần** theo `price_date`, rồi `created_at`.
- `detail=false`: mỗi ngày tối đa 1 dòng (lần ghi cuối trong ngày).
- `detail=true`: mọi lần fetch/update trong khoảng ngày.

**Lỗi:**

- `400` — thiếu `price_id`

---

#### `POST /api/v1/prices`

Tạo giá thủ công (JSON hoặc `multipart/form-data` nếu kèm ảnh).

**Body:**

| Field | Bắt buộc | Mô tả |
|-------|----------|--------|
| `source_id` | **Có** | Id nguồn (phải tồn tại) |
| `id` | **Có** | Id gốc; DB lưu thành `{id}-{source_id}` |
| `name` | **Có** | Tên giá |
| `type` | Không | |
| `buy` / `sell` | Không | Default `0` nếu không parse được |
| `change_buy` / `change_sell` | Không | |
| `currency` | Không | |
| `image` | Không | URL/path string **hoặc** file field `image` |
| `is_active` | Không | Default `true` |
| `diff_mode` | Không | |
| `buy_adjust` / `sell_adjust` | Không | |
| `price_formula` | Không | |
| `ref_id` | Không | Id giá gốc để sync |

**Ví dụ JSON:**

```json
{
  "source_id": 1,
  "id": "SJC-9999",
  "name": "Vàng SJC 9999",
  "type": "gold",
  "buy": 75000000,
  "sell": 76000000,
  "currency": "VND",
  "ref_id": "XAUUSD-1",
  "diff_mode": "vnd",
  "buy_adjust": -500000,
  "sell_adjust": -400000
}
```

→ DB lưu `prices.id = "SJC-9999-1"` (nối `-{source_id}`).

**Response `201`:**

```json
{
  "success": true,
  "data": {
    "id": "SJC-9999-1",
    "source_id": 1,
    "name": "Vàng SJC 9999",
    "type": "gold",
    "buy": 75000000,
    "sell": 76000000,
    "change_buy": 0,
    "change_sell": 0,
    "currency": "VND",
    "image": "",
    "is_active": true,
    "diff_mode": "vnd",
    "buy_adjust": -500000,
    "sell_adjust": -400000,
    "price_formula": null,
    "ref_id": "XAUUSD-1",
    "created_at": "...",
    "updated_at": "..."
  }
}
```

**Lỗi:**

- `400` — thiếu `source_id` / `name` / `id`; ảnh > 5MB
- `404` — nguồn không tồn tại
- `409` — trùng `(source_id, id)`

---

#### `PATCH /api/v1/prices/:sourceId/:id`

Cập nhật partial. `:id` là **full id** trong DB (vd `SJC-9999-1`), không phải id gốc trước khi nối.

**Body:** các field tùy chọn: `name`, `type`, `buy`, `sell`, `change_buy`, `change_sell`, `currency`, `diff_mode`, `buy_adjust`, `sell_adjust`, `price_formula`, `ref_id`, `is_active`, `image` (string hoặc file).

**Response `200`:** `{ "success": true, "data": { /* price */ } }`

**Lỗi:**

- `400` — params sai / không có field / tên rỗng
- `404` — không tìm thấy

---

#### `PATCH /api/v1/prices/:sourceId/:id/disable`

**Body:**

```json
{ "is_active": false }
```

- Không gửi `is_active` → mặc định `false`

**Response `200`:** `{ "success": true, "data": { /* price */ } }`

---

#### `DELETE /api/v1/prices/:sourceId/:id`

Xóa giá (+ cascade history).

**Response `200`:** `{ "success": true, "data": { /* price đã xóa */ } }`

---

## 7. Luồng hoạt động chi tiết

### 7.1. Request pipeline

```text
HTTP Request
  → cors()
  → parseMultipart()     # nếu multipart: multer memory, normalize body
  → express.json()
  → express.urlencoded()
  → route handler (controller)
       → service (nếu fetch)
       → db.query / transaction
  → JSON response
```

`parseMultipart` cũng normalize body khi **không** phải multipart (lấy phần tử đầu nếu array).

---

### 7.2. Luồng Fetch một nguồn (`fetchOne`)

```text
1. Validate sourceId
2. Load price_sources theo id
3. Reject nếu không tồn tại / disabled
4. Axios GET source.api (timeout 30s, Accept JSON)
5. Mark last_fetched_at
6. Lấy payload:
     - nếu source.key rỗng → dùng cả response.data
     - nếu có key → đi theo path `/` hoặc `.` (vd `data/gold/items` → data.data.gold.items)
7. parseSourceData(payload, source):
     - Hỗ trợ: array | { data: [] } | object map { "XAUUSD": {...} }
     - Map field_* → name, buy, sell, change_*
     - id = field_id(row) | objectKey | (phải có)
     - id cuối = "{id}-{source.id}"
     - Bỏ row thiếu id hoặc name
8. importPrices(source, list) trong TRANSACTION:
     Với mỗi item:
       a. Tìm prices WHERE id + source_id
       b. Nếu có: so sánh buy/sell → tính change_* nếu đổi
       c. UPDATE hoặc INSERT (+ copy diff_mode/adjust/formula từ source)
       d. Nếu raw thị trường đổi:
            - INSERT price_history (ngày hiện tại)
            - syncRefPrices(parent, insert): cập nhật ref_id + INSERT history child
       e. Nếu chỉ đổi công thức / hiển thị (raw giữ nguyên):
            - UPDATE price_history đang trùng buy/sell cũ → giá mới (đồng bộ UI)
            - syncRefPrices(parent, sync): cập nhật ref_id + UPDATE history child trùng giá cũ
     Cuối: cập nhật last_inserted / last_updated / last_fetched_at trên source
9. COMMIT → trả source + parsed list + imported stats
```

#### Quy tắc `applyAdjust`

| `diff_mode` | Công thức |
|-------------|-----------|
| `percent` / `pct` / `%` | `base + (base * adjust / 100)` |
| `vnd` (mặc định) | `base + adjust` |

---

### 7.3. Luồng Fetch tất cả (`fetchAll` / Cron)

```text
1. SELECT sources WHERE disabled = FALSE ORDER BY id
2. Với mỗi source:
     try { giống fetchOne (request → parse → import) }
     catch { ghi result success:false, tiếp tục }
3. Trả tổng: total / success / failed / results[]
```

---

### 7.4. Luồng giá phụ thuộc (`ref_id`)

Dùng để tạo giá “local” bám theo giá gốc từ nguồn ngoài:

1. Fetch import giá gốc `XAUUSD-1` (buy/sell mới).
2. Mọi `prices` có `ref_id = 'XAUUSD-1'` (trừ chính nó) được tính lại:
   - `newBuy = applyAdjust(parent.buy, child.buy_adjust, child.diff_mode)`
   - `newSell` tương tự
3. Nếu khác giá cũ:
   - Giá raw đổi → update + INSERT history
   - Chỉ đổi công thức → update + UPDATE history trùng buy/sell cũ

Tạo thủ công qua `POST /prices` với `ref_id` + `diff_mode` + `*_adjust`.

---

### 7.5. Luồng CRUD thủ công

**Tạo nguồn** → cấu hình `api` + `field_*` → **fetch** để đổ giá tự động.

**Tạo giá thủ công** → gắn `source_id` + id gốc (server nối `-{sourceId}`) → có thể gắn `ref_id`.

**Disable nguồn** → mặc định không còn trong `GET ?disabled=false`; dùng `?disabled=true` hoặc `?all=true` để xem. Không bị cron/`fetch-all` gọi (fetch từng id vẫn reject nếu disabled).

**Xóa nguồn** → CASCADE xóa prices + history.

---

## 8. Cron job

File: `src/jobs/cron.js`

| Thuộc tính | Giá trị |
|------------|---------|
| Expression | `FETCH_ALL_CRON` hoặc `*/25 * * * *` (mỗi 25 phút) |
| Job | `priceFetchService.fetchAll()` |
| Overlap | Nếu lần trước còn chạy → skip (log warn) |

Log mẫu:

```text
[cron] Đã lên lịch fetchAll: */25 * * * *
[cron] fetchAll bắt đầu 2026-08-27T07:00:00.000Z
[cron] fetchAll xong: total=3 success=3 failed=0
```

---

## 9. Upload ảnh

| Thuộc tính | Giá trị |
|------------|---------|
| Middleware | Multer memory, max **5MB** |
| Field | Ưu tiên `fieldname === "image"` + mimetype `image/*` |
| Lưu | `storages/uploads/prices/{safeId}-{timestamp}-{hex}.{ext}` |
| Public URL | `/uploads/prices/{filename}` |
| Định dạng | jpeg, png, webp, gif |

Áp dụng cho `POST /prices` và `PATCH /prices/:sourceId/:id`.

---

## 10. Mã lỗi thường gặp

| Tình huống | HTTP | `message` gợi ý |
|------------|------|-----------------|
| Thiếu tên nguồn / tên giá / id / source_id | 400 | `... là bắt buộc` |
| Không có field patch | 400 | `Không có field nào để cập nhật` |
| Nguồn/giá không tồn tại | 404 | `Không tìm thấy ...` |
| Trùng nguồn `(name, api, type)` | 409 | `Nguồn với cùng tên, URL và type đã tồn tại` |
| Trùng giá trong nguồn | 409 | `Giá với cùng id đã tồn tại trong nguồn này` |
| Nguồn disabled khi fetch | 400 | `Nguồn đang bị disabled` |
| Nguồn chưa có URL | 400 | `Nguồn chưa có URL API` |
| Upstream fail | 502 | `Không gọi được API nguồn` / `API nguồn trả về HTTP ...` |
| Ảnh quá lớn | 400 | `Ảnh tối đa 5MB` |
| Lỗi DB / không xác định | 500 | `Không ... được ...` |

---

## Phụ lục A — Object models (response)

### PriceSource

```ts
{
  id: number
  name: string
  api: string
  key: string
  type: string
  currency: string
  diff_mode: string
  buy_adjust: number
  sell_adjust: number
  price_formula: string
  field_id: string
  field_name: string
  field_buy: string
  field_sell: string
  field_change_buy: string
  field_change_sell: string
  last_inserted: number
  last_updated: number
  last_fetched_at: string | null
  disabled: boolean
  created_at: string
  updated_at: string
}
```

### Price

```ts
{
  id: string              // thường "{external}-{sourceId}"
  source_id: number
  name: string
  type: string
  buy: number
  sell: number
  change_buy: number
  change_sell: number
  currency: string
  image: string
  is_active: boolean
  diff_mode: string | null
  buy_adjust: number | null
  sell_adjust: number | null
  price_formula: string | null
  ref_id: string | null
  created_at: string
  updated_at: string
}
```

### PriceHistory

```ts
{
  id: number
  source_id: number
  price_id: string
  price_date: string      // YYYY-MM-DD
  buy: number
  sell: number
  change_buy: number
  change_sell: number
  currency: string
  created_at: string
  updated_at: string
}
```

---

## Phụ lục B — Ví dụ curl

Giả sử server chạy tại `http://localhost:4001` (đổi theo `PORT`).

```bash
BASE=http://localhost:4001

# Health
curl "$BASE/"

# --- Price sources ---
curl -X POST "$BASE/api/v1/price-sources" \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Demo",
    "api": "https://example.com/prices.json",
    "key": "data",
    "type": "gold",
    "currency": "VND",
    "field_name": "name",
    "field_buy": "buy",
    "field_sell": "sell"
  }'

curl "$BASE/api/v1/price-sources"
# --- Auth ---
curl -X POST "$BASE/api/v1/auth/register" \
  -H 'Content-Type: application/json' \
  -d '{"username":"demo","password":"secret12","name":"Demo"}'

curl -X POST "$BASE/api/v1/auth/login" \
  -H 'Content-Type: application/json' \
  -d '{"username":"demo","password":"secret12"}'

curl -X POST "$BASE/api/v1/auth/refresh" \
  -H 'Content-Type: application/json' \
  -d '{"refreshToken":"YOUR_REFRESH_TOKEN"}'

curl -X POST "$BASE/api/v1/auth/logout" \
  -H 'Content-Type: application/json' \
  -d '{"refreshToken":"YOUR_REFRESH_TOKEN"}'

# Passkey: sau khi có accessToken
curl -X POST "$BASE/api/v1/auth/webauthn/register/options" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"

curl -X POST "$BASE/api/v1/auth/webauthn/login/options" \
  -H 'Content-Type: application/json' \
  -d '{"username":"demo"}'

# --- Price sources ---
curl "$BASE/api/v1/price-sources?all=true"

curl -X PATCH "$BASE/api/v1/price-sources/1" \
  -H 'Content-Type: application/json' \
  -d '{"buy_adjust": 1000}'

curl -X PATCH "$BASE/api/v1/price-sources/1/disable" \
  -H 'Content-Type: application/json' \
  -d '{"disabled": true}'

curl -X POST "$BASE/api/v1/price-sources/1/fetch"
curl -X POST "$BASE/api/v1/price-sources/fetch-all"

curl -X DELETE "$BASE/api/v1/price-sources/1"

# --- Prices ---
curl "$BASE/api/v1/prices"
curl "$BASE/api/v1/prices?source_id=5&is_active=true"

curl "$BASE/api/v1/prices/history?price_id=BPQ10L-5&source_id=5&days=10"
curl "$BASE/api/v1/prices/history?price_id=BPQ10L-5&source_id=5&days=1&detail=true"

curl -X POST "$BASE/api/v1/prices" \
  -H 'Content-Type: application/json' \
  -d '{
    "source_id": 1,
    "id": "LOCAL-1",
    "name": "Giá local",
    "buy": 100,
    "sell": 110,
    "currency": "VND"
  }'

# Upload ảnh (multipart)
curl -X POST "$BASE/api/v1/prices" \
  -F 'source_id=1' \
  -F 'id=LOCAL-2' \
  -F 'name=Giá có ảnh' \
  -F 'buy=100' \
  -F 'sell=110' \
  -F 'image=@/path/to/photo.jpg'

curl -X PATCH "$BASE/api/v1/prices/1/LOCAL-1-1" \
  -H 'Content-Type: application/json' \
  -d '{"buy":105,"sell":115}'

curl -X PATCH "$BASE/api/v1/prices/1/LOCAL-1-1/disable" \
  -H 'Content-Type: application/json' \
  -d '{"is_active":false}'

curl -X DELETE "$BASE/api/v1/prices/1/LOCAL-1-1"
```

---

*Tài liệu đồng bộ với source hiện tại (`src/routes`, `src/controllers`, `src/services`, `db/migrations`). Cập nhật khi đổi API.*
