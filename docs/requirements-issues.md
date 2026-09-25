# Requirements Issues — Cần quyết định

Các câu hỏi dưới đây chưa được giải quyết trong `docs/01-requirements.md`. Không coi nội dung câu hỏi hay phương án gợi ý là requirement đã duyệt. Trạng thái ban đầu: **Open**.

| ID | Vấn đề / ảnh hưởng | Câu hỏi cần chủ dự án quyết định | Liên kết |
|---|---|---|---|
| ISSUE-001 | Ma trận quyền cho Admin, Coordinator, Volunteer/Donor chưa được mô tả; ảnh hưởng đăng nhập và toàn bộ thao tác quản lý. | Mỗi vai trò được xem/tạo/sửa/xóa/xác nhận những loại dữ liệu hoặc thao tác nào? | FR-001, FR-002, FR-003, FR-005, FR-008 |
| ISSUE-002 | Chưa có giới hạn số người cụ thể, cách cấu hình, hoặc kết quả hiển thị khi khung giờ đầy. | Ai đặt sức chứa; hệ thống xử lý đăng ký khi đã đủ chỗ ra sao? Có cần xử lý hai đăng ký đồng thời không? | FR-004, BR-001, AC-004, AC-005 |
| ISSUE-003 | Trạng thái “Hủy/Tải về” có vẻ gộp hai khái niệm hoặc có thể là lỗi ghi; không thể biến thành trạng thái nghiệp vụ chắc chắn. | Các trạng thái chính xác cần hỗ trợ là gì? “Tải về” có ý nghĩa nào trong nghiệp vụ? | FR-005, AC-006 |
| ISSUE-004 | Nhóm máu nêu ABO và Rh nhưng chưa quy định cách lưu/chọn các giá trị kết hợp hay ai nhập/xác nhận. | Bộ giá trị demo chính xác và quy tắc ghi nhận nhóm máu là gì? Xác nhận đây không phải kết quả y tế chính thức? | FR-006, AC-007 |
| ISSUE-005 | Chưa rõ nhắc lịch gửi qua giao diện, email, SMS hay kênh nào; chưa rõ thời điểm, lịch chạy, và cách xử lý lỗi. | Kênh nào, gửi trước lịch bao lâu, ai kích hoạt, và cần ghi nhận trạng thái gửi không? | FR-007, AC-008 |
| ISSUE-006 | “Tỷ lệ các nhóm máu thu thập được” chưa nêu mẫu số, cách tính, làm tròn, hoặc xử lý thiếu dữ liệu. | Tỷ lệ tính trên tổng người đăng ký, người tham gia thực tế hay tập dữ liệu khác? | FR-008, AC-009 |
| ISSUE-007 | AI sinh nội dung mời/nhắc lịch: chưa rõ đầu ra chỉ là bản nháp hay được gửi tự động; chưa rõ kiểm duyệt, sửa và dữ liệu chiến dịch được phép dùng. | Ai duyệt nội dung AI? AI chỉ tạo bản nháp hay được phép gửi? Trường chiến dịch nào có thể đưa vào prompt? | FR-009, NFR-007, AC-010 |
| ISSUE-008 | Tóm tắt chiến dịch hướng tới điều phối viên nhưng chưa rõ cách con người xác minh số liệu/nội dung và sử dụng báo cáo. | Báo cáo AI chỉ để tham khảo hay cần duyệt trước khi lưu/chia sẻ? Con người kiểm tra những phần nào? | FR-011, NFR-008, AC-013 |
| ISSUE-009 | Có yêu cầu giảm dữ liệu nhạy cảm trong prompt nhưng chưa có danh mục trường dữ liệu, phân loại nhạy cảm, mục đích và thời hạn lưu. | Hệ thống thực sự cần thu thập những trường cá nhân nào? Trường nào được gửi cho từng chức năng AI, ai được truy cập, và thời hạn lưu/xóa là gì? | FR-002, NFR-007, AC-018 |
| ISSUE-010 | Nguyên tắc AI-Augmented SDLC yêu cầu con người kiểm tra kết quả AI nhưng chưa chỉ rõ ai duyệt, artifact nào cần duyệt, hay cách ghi nhận. | Những đầu ra AI nào cần duyệt và ai là người phê duyệt? Cần lưu lại quyết định duyệt ở đâu? | NFR-008, AC-019 |
| ISSUE-011 | Chatbot chỉ dùng `docs/approved_docs/`, nhưng quy trình phê duyệt, định dạng, phiên bản và gỡ tài liệu chưa nêu. | Ai phê duyệt/quản lý tài liệu, làm sao đánh dấu phiên bản còn hiệu lực, và khi không tìm thấy bằng chứng thì dùng chính xác thông điệp từ chối nào? | FR-010, AC-011, AC-012 |
| ISSUE-012 | Chưa mô tả tạo tài khoản, cấp lại mật khẩu, đăng xuất, hoặc cách gắn người đăng ký với tài khoản. | Các luồng tài khoản nào nằm trong phạm vi project? Người đăng ký tự tạo tài khoản hay được quản trị viên tạo? | FR-001, FR-002 |
| ISSUE-013 | Chiến dịch có địa điểm/thời gian nhưng chưa rõ có nhiều phiên/khung giờ tại một hay nhiều điểm, múi giờ, hoặc chỉnh sửa/hủy chiến dịch. | Cấu trúc lịch chiến dịch và quy tắc cập nhật/hủy nào cần hỗ trợ? | FR-003, FR-004 |
| ISSUE-014 | Chưa rõ người đăng ký có thể tự hủy/đổi lịch, hay nhân viên thao tác; đây liên quan trạng thái và sức chứa. | Ai có thể hủy/đổi đăng ký và sức chứa được giải phóng khi nào? | FR-004, FR-005 |
| ISSUE-015 | “Đăng ký”, “người hiến”, “tình nguyện viên” có thể không cùng nghĩa; chưa có quy tắc dữ liệu cá nhân cần thu thập. | Các khái niệm này có cùng một loại người dùng/hồ sơ không? Hồ sơ tối thiểu cần trường nào? | FR-001, FR-002, ASM-001 |
| ISSUE-016 | Chưa có yêu cầu triển khai/đối tượng vận hành ngoài định hướng project sinh viên và công nghệ. | Ứng dụng chỉ chạy local để demo hay cần nhiều người dùng/máy truy cập? | NFR-001–NFR-008 |

## Trạng thái xác minh

Chưa có quyết định nào được ghi nhận tại thời điểm tạo artifact. Sau khi chủ dự án trả lời, cập nhật trạng thái issue và yêu cầu liên quan; không đóng issue bằng suy đoán.
