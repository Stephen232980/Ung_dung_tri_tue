# User Stories

Các story dưới đây được rút từ `docs/01-requirements.md`; trạng thái toàn bộ là **cần con người xác minh**. Story không quyết định các điểm còn mở trong `docs/requirements-issues.md`.

| ID | User story | Requirement |
|---|---|---|
| US-001 | Là người dùng thuộc một trong các vai trò được hỗ trợ, tôi muốn đăng nhập để sử dụng hệ thống theo vai trò của mình. | FR-001 |
| US-002 | Là người có trách nhiệm quản lý, tôi muốn quản lý hồ sơ và thông tin liên hệ của người đăng ký. | FR-002 |
| US-003 | Là người tổ chức, tôi muốn tạo và cập nhật chiến dịch, điểm hiến và thời gian tổ chức để thông tin chiến dịch được quản lý trong hệ thống. | FR-003 |
| US-004 | Là tình nguyện viên/người đăng ký, tôi muốn đăng ký một khung giờ hiến để tham gia chiến dịch; hệ thống kiểm soát sức chứa của khung giờ. | FR-004 |
| US-005 | Là người phụ trách ghi nhận tham gia, tôi muốn cập nhật trạng thái tham gia theo các trạng thái được hệ thống hỗ trợ. | FR-005 |
| US-006 | Là người quản lý dữ liệu demo, tôi muốn ghi nhận nhóm máu trong các giá trị được nêu để phục vụ dữ liệu chiến dịch. | FR-006 |
| US-007 | Là người đăng ký, tôi muốn nhận nhắc lịch hiến máu để biết lịch đã đăng ký. | FR-007 |
| US-008 | Là người xem báo cáo, tôi muốn xem số đăng ký, lượt tham gia thực tế và tỷ lệ nhóm máu để theo dõi chiến dịch. | FR-008 |
| US-009 | Là người chuẩn bị truyền thông, tôi muốn AI tạo bản nháp thông báo mời tham gia hoặc nhắc lịch từ thông tin chiến dịch. | FR-009 |
| US-010 | Là người hỏi về quy trình hiến máu, tôi muốn chatbot trả lời trong phạm vi tài liệu được duyệt, từ chối nội dung ngoài phạm vi và nêu rõ AI không tư vấn y khoa cá nhân. | FR-010, FR-012, NFR-006 |
| US-011 | Là điều phối viên, tôi muốn nhận bản tóm tắt do AI tạo từ số liệu tổng hợp chiến dịch để tham khảo kết quả. | FR-011 |
| US-012 | Là người phát triển/vận hành, tôi muốn hệ thống dùng Flask/Python, HTML/CSS/JavaScript và SQLite như công nghệ dự kiến. | NFR-001, NFR-002, NFR-003 |
| US-013 | Là người vận hành tích hợp AI, tôi muốn API key được cấu hình ngoài source trong `.env` để tránh hard-code bí mật. | NFR-004 |
| US-014 | Là người bảo trì, tôi muốn có pytest cho các luồng được yêu cầu để kiểm tra hành vi hệ thống. | NFR-005 |
| US-015 | Là người dùng dữ liệu, tôi muốn dữ liệu cá nhân nhạy cảm không cần thiết không được gửi đến AI. | NFR-007 |
| US-016 | Là người duyệt dự án, tôi muốn đầu ra do AI tạo được xem xét bởi con người thay vì được mặc định là đúng. | NFR-008 |

