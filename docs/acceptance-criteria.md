# Acceptance Criteria

Các tiêu chí là điều kiện kiểm thử cho hành vi đã nêu. Những giá trị hoặc chính sách chưa có trong nguồn được dẫn tới issue, không tự đặt trong tiêu chí.

| ID | Given / When / Then | Requirement | Story |
|---|---|---|---|
| AC-001 | Given ứng dụng có cấu hình vai trò, when người dùng đăng nhập thành công, then phiên đăng nhập được gắn với một trong các vai trò Admin, Coordinator hoặc Volunteer/Donor. Ma trận quyền cần được chốt trước khi kiểm thử quyền chi tiết (ISSUE-001). | FR-001 | US-001 |
| AC-002 | Given người có quyền quản lý người đăng ký (quyền cần chốt tại ISSUE-001), when họ tạo hoặc cập nhật hồ sơ, then hồ sơ và thông tin liên hệ được lưu và hiển thị lại đúng các giá trị đã nhập. | FR-002 | US-002 |
| AC-003 | Given người có quyền quản lý chiến dịch (cần chốt tại ISSUE-001), when họ tạo hoặc cập nhật chiến dịch với địa điểm và thời gian, then hệ thống lưu và hiển thị lại các thông tin đó. | FR-003 | US-003 |
| AC-004 | Given một khung giờ còn sức chứa, when người dùng đăng ký lịch, then đăng ký được ghi nhận gắn với khung giờ đã chọn. | FR-004 | US-004 |
| AC-005 | Given số đăng ký của khung giờ đã đạt giới hạn tối đa, when người dùng yêu cầu đăng ký thêm, then hệ thống không làm số đăng ký vượt quá giới hạn. Hình thức phản hồi cho người dùng cần chốt tại ISSUE-002. | FR-004 | US-004 |
| AC-006 | Given một lượt đăng ký, when người có quyền cập nhật trạng thái thay đổi trạng thái, then giá trị được lưu đúng trong các lựa chọn đã được xác nhận. Tên “Tải về” cần giải quyết tại ISSUE-003 trước khi hoàn tất bộ kiểm thử. | FR-005 | US-005 |
| AC-007 | Given hồ sơ dữ liệu demo có nhóm máu, when người quản lý chọn giá trị, then hệ thống chỉ chấp nhận các nhóm A, B, AB, O và yếu tố Rh+/- được hỗ trợ. Cách biểu diễn kết hợp cần chốt tại ISSUE-004. | FR-006 | US-006 |
| AC-008 | Given người đăng ký có lịch hiến, when chức năng nhắc lịch được kích hoạt, then thông báo nhắc lịch được gửi đến người đăng ký đó. Kênh, thời điểm và cơ chế kích hoạt phải được chốt tại ISSUE-005. | FR-007 | US-007 |
| AC-009 | Given dữ liệu đăng ký, tham gia và nhóm máu của một chiến dịch, when người dùng xem báo cáo, then báo cáo hiển thị số người đăng ký, số lượt tham gia thực tế và tỷ lệ nhóm máu. Công thức tỷ lệ phải được chốt tại ISSUE-006. | FR-008 | US-008 |
| AC-010 | Given dữ liệu chiến dịch, when người dùng yêu cầu AI tạo thông báo mời hoặc nhắc lịch, then đầu ra là nội dung thông báo dựa trên thông tin chiến dịch được cung cấp. Người duyệt và hành vi gửi nội dung cần chốt tại ISSUE-007. | FR-009 | US-009 |
| AC-011 | Given câu hỏi có nội dung được hỗ trợ trong tài liệu tổ chức đã phê duyệt, when câu hỏi được gửi tới chatbot, then câu trả lời chỉ dựa trên nội dung tài liệu được duyệt. | FR-010, NFR-006 | US-010 |
| AC-012 | Given câu hỏi không được tài liệu tổ chức đã phê duyệt hỗ trợ, when câu hỏi được gửi tới chatbot, then chatbot không đưa câu trả lời suy đoán và thông báo không thể cung cấp câu trả lời, hướng người dùng đến nhân viên/chuyên gia phù hợp. | FR-010, NFR-006 | US-010 |
| AC-013 | Given dữ liệu tổng hợp chiến dịch gồm số lượng, tỷ lệ tham gia và nhóm máu, when điều phối viên yêu cầu tóm tắt AI, then hệ thống tạo bản tóm tắt dựa trên dữ liệu tổng hợp được cung cấp. Cách xem xét/duyệt báo cáo cần chốt tại ISSUE-008. | FR-011 | US-011 |
| AC-014 | Given giao diện chatbot/AI, when người dùng xem chức năng, then cảnh báo chính xác “AI không tư vấn y khoa cá nhân” được hiển thị; với câu hỏi mang tính tư vấn sức khỏe cá nhân, AI không đưa lời khuyên cá nhân. | FR-012, NFR-006 | US-010 |
| AC-015 | Given mã nguồn/configuration của ứng dụng, when kiểm tra stack, then backend là Python/Flask, frontend gồm HTML/CSS/JavaScript, database là SQLite. | NFR-001, NFR-002, NFR-003 | US-012 |
| AC-016 | Given cấu hình chạy ứng dụng, when ứng dụng cần OpenAI API key, then key được đọc từ `.env` và không xuất hiện dưới dạng hard-coded trong source. | NFR-004 | US-013 |
| AC-017 | Given test suite pytest, when chạy suite, then tồn tại test bao phủ đăng ký lịch, kiểm soát sức chứa khung giờ, gửi thông báo và từng chức năng AI (sinh thông báo, chatbot, tóm tắt). | NFR-005 | US-014 |
| AC-018 | Given request/prompt gửi tới AI, when dữ liệu đầu vào được chuẩn bị, then dữ liệu nhạy cảm không cần thiết không có trong payload gửi đi. Danh mục trường được xem là nhạy cảm/cần thiết cần chốt tại ISSUE-009. | NFR-007 | US-015 |
| AC-019 | Given đầu ra do AI tạo trong quy trình phát triển, when đầu ra được đưa vào artifact/báo cáo dự án, then có bước hoặc ghi nhận con người kiểm tra trước khi xem là nội dung được chấp nhận. Cách thức và phạm vi ghi nhận cần chốt tại ISSUE-010. | NFR-008 | US-016 |

