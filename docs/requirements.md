# Requirements — Hệ thống quản lý hiến máu tình nguyện có tích hợp AI

## Trạng thái và nguồn

- Trạng thái: bản phân tích từ tài liệu hiện có, cần con người xác minh; chưa ghi nhận phê duyệt requirements trong repo.
- Nguồn chính: `docs/01-requirements.md`.
- Phạm vi dưới đây chỉ chuẩn hóa nội dung nguồn; các chi tiết chưa nêu được liệt kê tại `docs/requirements-issues.md`.

## Stakeholders

| Stakeholder | Quan tâm / vai trò theo nguồn | Trạng thái |
|---|---|---|
| Đơn vị tổ chức hiến máu | Vận hành công tác hiến máu và phê duyệt tài liệu quy trình | Được nêu |
| Quản trị viên | Quản trị hệ thống; chi tiết quyền chưa nêu | Vai trò được nêu |
| Điều phối viên | Điều phối chiến dịch; nhận báo cáo tóm tắt | Vai trò được nêu |
| Tình nguyện viên/người đăng ký | Sử dụng hệ thống đăng ký và nhận nhắc lịch | Vai trò được nêu |
| Người phụ trách tài liệu được duyệt | Xác nhận tài liệu chatbot được phép dùng; cá nhân/role chưa nêu | Cần xác nhận |
| Người phát triển/vận hành dự án | Xây dựng và vận hành ứng dụng theo công nghệ dự kiến | Bối cảnh dự án; trách nhiệm cụ thể chưa nêu |

## Actors

| Actor | Tương tác được nguồn hỗ trợ |
|---|---|
| Quản trị viên (Admin) | Đăng nhập; quyền cụ thể cần xác nhận |
| Điều phối viên (Coordinator) | Đăng nhập; quản lý/điều phối chiến dịch và xem tóm tắt theo mô tả; quyền cụ thể cần xác nhận |
| Tình nguyện viên/Người đăng ký (Volunteer/Donor) | Đăng nhập, đăng ký lịch, nhận nhắc lịch theo mô tả |
| OpenAI API | Dịch vụ AI dự kiến cho chức năng sinh nội dung, hỏi đáp và tóm tắt |
| Người quản lý/phê duyệt tài liệu quy trình | Có liên quan đến tài liệu được duyệt; actor và quyền chưa xác định |

## Functional requirements

| ID | Yêu cầu chức năng | Nguồn |
|---|---|---|
| FR-001 | Hệ thống hỗ trợ đăng nhập và ba vai trò: Admin, Coordinator, Volunteer/Donor. Ma trận quyền của từng vai trò chưa được quy định. | §3.1.1 |
| FR-002 | Hệ thống cho phép quản lý hồ sơ và thông tin liên hệ của người đăng ký. | §3.1.2 |
| FR-003 | Hệ thống cho phép tạo và cập nhật chiến dịch hiến máu, địa điểm và thời gian tổ chức. | §3.1.3 |
| FR-004 | Người dùng có thể đăng ký lịch hiến máu theo khung giờ; hệ thống kiểm soát số lượng tối đa trên mỗi khung giờ để tránh quá tải. Giá trị giới hạn và hành vi khi đủ chỗ chưa được quy định. | §3.1.4 |
| FR-005 | Hệ thống ghi nhận trạng thái tham gia gồm các trạng thái được tài liệu ghi là “Đã đăng ký”, “Đã tham gia”, “Hủy/Tải về”. Ý nghĩa “Tải về” cần xác nhận. | §3.1.5 |
| FR-006 | Hệ thống quản lý nhóm máu ở mức dữ liệu demo, gồm nhóm A, B, AB, O và yếu tố Rh+/- theo cách kết hợp chưa được mô tả. | §3.1.6 |
| FR-007 | Hệ thống gửi thông báo/nhắc lịch hiến máu đến người đăng ký. Kênh gửi và lịch gửi chưa được quy định. | §3.1.7 |
| FR-008 | Hệ thống cung cấp thống kê số người đăng ký, số lượt tham gia thực tế và tỷ lệ các nhóm máu thu thập được. Công thức tính tỷ lệ chưa được quy định. | §3.1.8 |
| FR-009 | AI tạo nội dung thông báo mời tham gia và nhắc lịch dựa trên thông tin chiến dịch. | §3.2.1 |
| FR-010 | Chatbot trả lời câu hỏi về điều kiện và quy trình hiến máu chỉ dựa trên tài liệu tổ chức đã phê duyệt trong `docs/approved_docs/`. Nếu câu hỏi vượt ngoài tài liệu được duyệt, hệ thống từ chối trả lời. | §3.2.2, §4 |
| FR-011 | AI phân tích dữ liệu tổng hợp của chiến dịch (số lượng, tỷ lệ tham gia, nhóm máu) để tạo báo cáo tóm tắt cho điều phối viên. | §3.2.3 |
| FR-012 | Giao diện hệ thống hiển thị cảnh báo “AI không tư vấn y khoa cá nhân”. | §4 |

## Non-functional requirements

| ID | Yêu cầu phi chức năng / ràng buộc | Cách kiểm chứng | Nguồn |
|---|---|---|---|
| NFR-001 | Backend sử dụng Python và Flask. | Kiểm tra cấu hình/dependencies và ứng dụng chạy bằng Flask. | §4 |
| NFR-002 | Frontend sử dụng HTML, CSS và JavaScript cho giao diện web. | Kiểm tra tài nguyên giao diện của ứng dụng. | §4 |
| NFR-003 | Cơ sở dữ liệu sử dụng SQLite. | Kiểm tra cấu hình kết nối và file database runtime. | §4 |
| NFR-004 | Tích hợp AI dự kiến sử dụng OpenAI API; API key được lưu trong `.env`, không hard-code trong source. | Rà soát cấu hình/source; xác nhận bí mật không xuất hiện trong source. | §4 |
| NFR-005 | Dùng pytest; phải có test cho đăng ký lịch, kiểm soát khung giờ, gửi thông báo và các chức năng AI. | Kiểm tra test suite có các nhóm kiểm thử tương ứng. | §4 |
| NFR-006 | AI không được tư vấn thông tin sức khỏe cá nhân; chatbot chỉ trả lời quy trình từ tài liệu được duyệt và từ chối câu hỏi ngoài phạm vi. | Kiểm thử câu hỏi trong/ngoài tài liệu và rà soát nội dung đầu ra theo nguồn duyệt. | §2, §4 |
| NFR-007 | Thông tin đầu vào gửi cho AI phải giới hạn ở dữ liệu cần thiết; không đưa dữ liệu cá nhân nhạy cảm không cần thiết vào prompt. | Rà soát cấu trúc dữ liệu/prompt và test xác nhận trường nhạy cảm không cần thiết bị loại bỏ. | Yêu cầu nền do chủ dự án nêu trong hội thoại; cần định nghĩa danh mục dữ liệu |
| NFR-008 | Quy trình phát triển AI-Augmented SDLC có kiểm soát; kết quả AI không được coi là đúng tuyệt đối và cần có báo cáo để con người kiểm tra. | Kiểm tra artifacts/review có ghi nhận đầu ra AI và bước xác minh của con người. | Yêu cầu nền do chủ dự án nêu trong hội thoại |

## Business rules đã được nêu

| ID | Quy tắc | Liên kết |
|---|---|---|
| BR-001 | Số người đăng ký trong mỗi khung giờ không vượt quá giới hạn tối đa được cấu hình/xác định. Giá trị và cách xác định giới hạn còn mở. | FR-004 |
| BR-002 | Dữ liệu nhóm máu demo gồm A, B, AB, O và Rh+/-; không được hiểu là kết quả y tế đã xác minh. | FR-006 |
| BR-003 | Chatbot chỉ dùng tài liệu quy trình hiến máu do tổ chức phê duyệt; câu hỏi vượt phạm vi tài liệu phải bị từ chối. | FR-010, NFR-006 |
| BR-004 | AI không tư vấn y khoa cá nhân. | FR-012, NFR-006 |
| BR-005 | Không hard-code OpenAI API key; lấy từ `.env`. | NFR-004 |

## Assumptions

| ID | Giả định tạm thời | Ảnh hưởng | Trạng thái |
|---|---|---|---|
| ASM-001 | Các cụm “người đăng ký”, “tình nguyện viên” và “người hiến” trong tài liệu có thể chỉ cùng nhóm người dùng ở một số luồng, nhưng chưa xác nhận là cùng một loại hồ sơ. | FR-001, FR-002, FR-004, FR-007 | Chưa được duyệt; cần xác nhận |
| ASM-002 | Các tên trạng thái được giữ nguyên văn bản hiện tại, không diễn giải “Tải về” thành trạng thái khác. | FR-005 | Chưa được duyệt; cần xác nhận |

## Kiểm tra các chủ đề nghiệp vụ

| Chủ đề | Phân loại | Requirement / ghi chú |
|---|---|---|
| Đăng nhập | Được nêu | FR-001 |
| Phân quyền | Được nêu một phần | FR-001 nêu 3 vai trò; quyền cụ thể chưa nêu, xem ISSUE-001 |
| Người đăng ký | Được nêu | FR-002 |
| Chiến dịch hiến máu | Được nêu | FR-003 |
| Điểm hiến máu | Được nêu | FR-003 |
| Thời gian hiến | Được nêu | FR-003 |
| Đăng ký lịch | Được nêu | FR-004 |
| Giới hạn số lượng theo khung giờ | Được nêu một phần | FR-004; giới hạn/hành vi khi đầy chưa nêu |
| Trạng thái tham gia | Được nêu một phần | FR-005; “Tải về” chưa rõ |
| Nhóm máu | Được nêu | FR-006 |
| Thông báo nhắc lịch | Được nêu một phần | FR-007; kênh/thời điểm chưa nêu |
| Thống kê | Được nêu một phần | FR-008; công thức tỷ lệ chưa nêu |
| AI sinh thông báo | Được nêu | FR-009 |
| AI chatbot | Được nêu | FR-010 |
| AI tóm tắt chiến dịch | Được nêu | FR-011 |
| Bảo vệ dữ liệu cá nhân | Được nêu ở mức nguyên tắc | NFR-007; loại dữ liệu, quyền truy cập, lưu giữ và xóa chưa nêu |
| AI không tư vấn y khoa cá nhân | Được nêu | FR-012, NFR-006 |

## Traceability: requirement → user story → acceptance criteria

| Requirement | User story | Acceptance criteria |
|---|---|---|
| FR-001 | US-001 | AC-001 |
| FR-002 | US-002 | AC-002 |
| FR-003 | US-003 | AC-003 |
| FR-004 | US-004 | AC-004, AC-005 |
| FR-005 | US-005 | AC-006 |
| FR-006 | US-006 | AC-007 |
| FR-007 | US-007 | AC-008 |
| FR-008 | US-008 | AC-009 |
| FR-009 | US-009 | AC-010 |
| FR-010 | US-010 | AC-011, AC-012 |
| FR-011 | US-011 | AC-013 |
| FR-012 | US-010 | AC-014 |
| NFR-001–NFR-003 | US-012 | AC-015 |
| NFR-004 | US-013 | AC-016 |
| NFR-005 | US-014 | AC-017 |
| NFR-006 | US-010 | AC-011, AC-012, AC-014 |
| NFR-007 | US-015 | AC-018 |
| NFR-008 | US-016 | AC-019 |

## Chưa được xác định

Xem `docs/requirements-issues.md` trước khi chốt quyền truy cập, trạng thái, giới hạn sức chứa, lịch nhắc, cách thống kê, quản trị tài liệu, lưu dữ liệu cá nhân và quy trình phê duyệt đầu ra AI.
