# Git Commit Generation Rules

Khi được yêu cầu tạo (generate) commit message, bạn (AI) PHẢI luôn kiểm tra xem các file thay đổi đang nằm ở thư mục nào để viết nội dung commit cho phù hợp:

1. **App (Ứng dụng di động):** Nếu các thay đổi chủ yếu nằm trong thư mục gốc của Flutter app (ví dụ: `lib/`, `android/`, `ios/`, ...), hãy tập trung mô tả commit message dựa trên logic, UI/UX hoặc tính năng của Mobile App. KHÔNG được nhầm lẫn sang backend.
2. **Backend (BE):** Nếu các thay đổi nằm trong thư mục `backend/` (hoặc thư mục API server), hãy mô tả các thay đổi liên quan đến API, Database, Server logic.
3. **Web:** Nếu có thay đổi ở thư mục Web, hãy tập trung vào frontend web.

**Quy tắc bắt buộc:**
- Luôn ưu tiên xem các file bị thay đổi (staged changes) hoặc thư mục làm việc hiện tại trước khi tạo commit message.
- Sử dụng chuẩn **Conventional Commits** (ví dụ: `feat:`, `fix:`, `chore:`, `refactor:`, `docs:`, v.v.) ở đầu mỗi commit.
- Kết hợp với phân tách scope của commit theo dạng: `feat[App]:` hoặc `[App] feat:` (tuỳ theo quy ước dự án) để dễ phân biệt. Ví dụ: `fix[App]: update ui` hoặc `[BE] feat: add user api`.
- Không mix các context không liên quan nếu commit chỉ giới hạn ở một platform cụ thể.
