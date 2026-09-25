# Architecture Decision Records

Trạng thái mặc định của các quyết định dưới đây là **Proposed**. Theo Skill `architecture-design`, chỉ con người mới có thể chuyển trạng thái thành **Accepted**. Không quyết định nào dưới đây thay đổi requirements.

## ADR-001 — Dùng modular monolith phân lớp

- **Trạng thái:** Proposed
- **Ngữ cảnh:** Project là ứng dụng sinh viên, stack đã dự kiến gồm Python/Flask và SQLite; requirements chưa nêu quy mô cần nhiều dịch vụ độc lập.
- **Quyết định đề xuất:** Tổ chức một ứng dụng Flask theo các lớp presentation, application services, repository và external adapters; chia module theo nghiệp vụ.
- **Lý do:** Đáp ứng phạm vi hiện có với cấu trúc dễ chạy và giải thích; giữ ranh giới trách nhiệm mà không thêm hạ tầng.
- **Hệ quả:** Các module dùng chung tiến trình; khi thay đổi cần giữ dependency qua service/repository boundary. Khả năng scale phân tán không phải mục tiêu hiện được yêu cầu.
- **Phương án đã cân nhắc:** Một khối không phân lớp (ranh giới trách nhiệm khó rõ); microservices (thêm vận hành và công nghệ chưa được yêu cầu).
- **Requirement links:** NFR-001–NFR-003; toàn bộ FR trong phạm vi.

## ADR-002 — Tách tích hợp OpenAI qua adapter nội bộ

- **Trạng thái:** Proposed
- **Ngữ cảnh:** Ba chức năng AI cần gọi OpenAI API; yêu cầu không hard-code API key và giới hạn dữ liệu gửi.
- **Quyết định đề xuất:** Các AI service gọi một adapter nội bộ; adapter lấy cấu hình bí mật từ `.env` và là điểm kiểm soát request/response tới API.
- **Lý do:** Gom kiểm soát boundary bên ngoài và giảm phụ thuộc trực tiếp của logic nghiệp vụ vào client/provider.
- **Hệ quả:** AI flows cần qua adapter; cần kiểm tra payload để tránh dữ liệu nhạy cảm không cần thiết. Không chỉ định SDK/version ở giai đoạn architecture.
- **Phương án đã cân nhắc:** Gọi API trực tiếp từ route (trộn giao tiếp HTTP, bảo mật và nghiệp vụ).
- **Requirement links:** FR-009–FR-011, NFR-004, NFR-007.

## ADR-003 — Ground chatbot trên tài liệu được tổ chức duyệt

- **Trạng thái:** Proposed; nguyên tắc grounding/refusal là ràng buộc từ requirements, cách triển khai còn mở.
- **Ngữ cảnh:** Chatbot chỉ được trả lời quy trình dựa trên tài liệu đã phê duyệt; thiếu thông tin thì phải báo chưa có trong tài liệu.
- **Quyết định đề xuất:** Grounded Q&A service lấy ngữ cảnh từ nguồn tài liệu duyệt, chỉ gửi phần liên quan cần thiết, và có nhánh từ chối khi không có bằng chứng hỗ trợ.
- **Lý do:** Giữ giới hạn câu trả lời theo nguồn được phê duyệt, tránh để mô hình tự bổ sung kiến thức ngoài nguồn.
- **Hệ quả:** Cần con người quyết định quy trình duyệt tài liệu, định dạng, versioning, tìm kiếm và tiêu chí xác định không đủ căn cứ. Không dùng tài liệu chưa duyệt.
- **Phương án đã cân nhắc:** Hỏi mô hình không có tài liệu nền (không đáp ứng giới hạn); để mô hình tự quyết định nguồn (không đảm bảo grounding).
- **Requirement links:** FR-010, NFR-006.
- **Open issues:** ISSUE-011 nếu có trong `docs/requirements-issues.md`.

## ADR-004 — Dùng SQLite qua repository boundary

- **Trạng thái:** Proposed; công nghệ SQLite được nêu trong baseline, cách tổ chức truy cập là đề xuất kiến trúc.
- **Ngữ cảnh:** Project chọn SQLite và cần quản lý người đăng ký, chiến dịch, khung giờ, trạng thái và báo cáo.
- **Quyết định đề xuất:** Application services truy cập SQLite thông qua repository/data-access components.
- **Lý do:** Giữ SQL/storage concerns khỏi routes và nghiệp vụ; phù hợp stack đã chọn.
- **Hệ quả:** Quy mô, sao lưu, concurrency limits và triển khai nhiều tiến trình cần được đánh giá nếu requirements vận hành thay đổi; không tự đặt hiện tại.
- **Phương án đã cân nhắc:** Truy vấn SQLite trực tiếp trong routes (tăng coupling).
- **Requirement links:** FR-002–FR-008, NFR-003.

## ADR-005 — Giữ kết quả AI có thể xem xét bởi con người

- **Trạng thái:** Proposed; yêu cầu con người kiểm tra đầu ra được nêu trong nguyên tắc dự án.
- **Ngữ cảnh:** AI tạo thông báo và tóm tắt; kết quả không được coi là đúng tuyệt đối. Requirements chưa chốt rõ khâu duyệt và nội dung nào được tự động gửi.
- **Quyết định đề xuất:** Kiến trúc trả kết quả AI về luồng ứng dụng để có thể hiển thị/kiểm tra; không thiết kế gửi thông báo AI tự động trước khi người dùng quyết định quy trình duyệt.
- **Lý do:** Không mặc định nội dung sinh ra là chính xác và giữ điểm kiểm tra của con người.
- **Hệ quả:** Người có thẩm quyền, bước duyệt, cách lưu audit và việc có cho phép tự động gửi còn cần quyết định; kiến trúc hiện chưa chốt hành vi sản phẩm.
- **Phương án đã cân nhắc:** Tự động phát hành đầu ra AI (không có căn cứ phê duyệt hiện tại).
- **Requirement links:** FR-009, FR-011, NFR-008.
- **Open issues:** ISSUE-007, ISSUE-008, ISSUE-010 nếu có trong `docs/requirements-issues.md`.

## Các quyết định chờ requirements clarification

- Ma trận quyền các vai trò.
- Kênh gửi nhắc lịch và cơ chế lập lịch/kích hoạt.
- Quy tắc cạnh tranh đồng thời khi khung giờ gần đầy.
- Quy trình sở hữu, phê duyệt, versioning và gỡ tài liệu chatbot.
- Danh mục dữ liệu cá nhân, retention và xóa.
- Quy trình duyệt thông báo/tóm tắt AI.
- Cách triển khai và môi trường chạy ngoài máy phát triển, nếu cần.
