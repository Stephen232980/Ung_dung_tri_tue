# ĐỀ TÀI: HỆ THỐNG QUẢN LÝ HIẾN MÁU TÌNH NGUYỆN CÓ TÍCH HỢP AI

## 1. Mô tả bài toán
Đơn vị tổ chức hiến máu cần quản lý người đăng ký, lịch hiến, điểm hiến, nhóm máu, trạng thái tham gia và nhắc lịch. Nếu quản lý thủ công, dễ trùng lịch, khó thống kê nguồn máu và mất thời gian truyền thông. 

Hệ thống được xây dựng nhằm quản lý hiến máu tình nguyện và tích hợp AI để:
- Sinh thông báo mời tham gia và nhắc lịch.
- Trả lời quy trình hiến máu từ tài liệu được phê duyệt.
- Tóm tắt kết quả chiến dịch hiến máu.

---

## 2. Mục tiêu
1. Quản lý toàn bộ vòng đời đăng ký, lịch hiến, điểm hiến, kết quả tham gia và báo cáo thống kê.
2. Tích hợp AI sinh thông báo, hỏi đáp quy trình hiến máu và tóm tắt kết quả chiến dịch.
3. Áp dụng AI-Augmented SDLC có kiểm soát, tuân thủ nghiêm ngặt quy định về bảo mật và không xử lý/tư vấn thông tin sức khỏe cá nhân.

---

## 3. Yêu cầu chức năng

### 3.1. Chức năng Quản lý (Non-AI)
1. **Đăng nhập và phân quyền:** Hỗ trợ 3 vai trò: Quản trị viên (Admin), Điều phối viên (Coordinator), Tình nguyện viên/Người đăng ký (Volunteer/Donor).
2. **Quản lý người đăng ký:** Quản lý thông tin hồ sơ và thông tin liên hệ.
3. **Quản lý chiến dịch & điểm hiến:** Tạo mới, cập nhật chiến dịch hiến máu, địa điểm và thời gian tổ chức.
4. **Đăng ký lịch hiến:** Người dùng đăng ký tham gia hiến máu; hệ thống tự động kiểm soát số lượng tối đa theo từng khung giờ để tránh quá tải.
5. **Ghi nhận trạng thái tham gia:** Cập nhật trạng thái (Đã đăng ký, Đã tham gia, Hủy/Tải về).
6. **Quản lý nhóm máu:** Quản lý thông tin nhóm máu ở mức dữ liệu demo (A, B, AB, O, Rh+/-).
7. **Gửi thông báo nhắc lịch:** Gửi thông báo/nhắc lịch hiến máu đến người đăng ký.
8. **Thống kê báo cáo:** Thống kê số lượng người đăng ký, số lượt tham gia thực tế, và tỷ lệ các nhóm máu thu thập được.

### 3.2. Chức năng AI
1. **AI sinh thông báo:** Tự động tạo nội dung thông báo mời tham gia và nhắc lịch dựa trên thông tin chiến dịch.
2. **Chatbot hỏi đáp quy trình (Grounded Q&A):** Trả lời thắc mắc về điều kiện và quy trình hiến máu **chỉ** từ tài liệu đã được tổ chức phê duyệt (`docs/approved_docs/`).
3. **AI tóm tắt chiến dịch:** Phân tích dữ liệu tổng hợp của chiến dịch (số lượng, tỉ lệ tham gia, nhóm máu) để tạo báo cáo tóm tắt cho điều phối viên.

---

## 4. Yêu cầu kỹ thuật
- **Backend:** Python (Flask).
- **Frontend:** HTML, CSS, JavaScript (Nội dung hiển thị giao diện web).
- **Database:** SQLite.
- **AI Engine:** OpenAI API (API Key lưu trong file `.env`, không hard-code).
- **Testing:** `pytest` (Có test case bắt buộc cho đăng ký lịch, kiểm soát khung giờ, gửi thông báo và các chức năng AI).
- **Ràng buộc an toàn AI:** Hế thống bắt buộc hiển thị cảnh báo **"AI không tư vấn y khoa cá nhân"** và tự động từ chối trả lời nếu câu hỏi vượt ngoài tài liệu quy trình được duyệt.

---

## 5. Dữ liệu hệ thống & AI Prompting

### Dữ liệu chính
- Người đăng ký (Users/Volunteers)
- Chiến dịch & Điểm hiến (Campaigns & Locations)
- Lịch đăng ký & Khung giờ (Schedules & Slots)
- Trạng thái tham gia & Nhóm máu demo (Status & Blood Types)
- Tài liệu quy trình hiến máu chính thức (Approved Knowledge Base Documents)

### Luồng Dữ liệu AI
- **Đầu vào AI:** Thông tin chiến dịch, tài liệu quy trình đã phê duyệt, số liệu tổng hợp chiến dịch.
- **Đầu ra AI:** Văn bản thông báo mời, câu trả lời quy trình hiến máu, bản tóm tắt chiến dịch.

### Sample Prompt Mẫu (AI Grounding)
```text
System: Bạn là trợ lý chiến dịch hiến máu. Bạn CHỈ được phép trả lời dựa trên tài liệu quy trình đã được phê duyệt. Tuyệt đối KHÔNG tư vấn y khoa cá nhân. Nếu câu hỏi ngoài tài liệu, hãy thông báo hệ thống không thể cung cấp câu trả lời và hướng dẫn liên hệ nhân viên y tế.

User: Thông tin chiến dịch: {{campaign_info}}. Hãy viết thông báo mời tham gia ngắn gọn và thân thiện.