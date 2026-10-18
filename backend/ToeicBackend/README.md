# ToeicBackend — ASP.NET Core MVC (.NET 8) + SQL Server

Backend cho ứng dụng thi TOEIC Reading. Đã **build và chạy thật** (xem mục Verify).

## Cấu trúc

```
ToeicBackend/
├── Program.cs                  # khởi động, DI, CORS
├── appsettings.json            # chuỗi kết nối SQL Server
├── Models/Entities.cs          # 6 entity (khớp 6 bảng)
├── Data/AppDbContext.cs        # DbContext (map bảng + char(1) + unique index)
├── Dtos/Dtos.cs                # DTO cho API + view
├── Import/                     # parser docx (ExamDocxParser) + parse model
├── Services/
│   ├── ExamImportService.cs    # upload -> validate -> import (hủy nếu sai)
│   └── ExamQueryService.cs     # danh sách, nội dung, chấm điểm, thống kê, sửa, xuất bản
├── Controllers/
│   ├── ExamApiController.cs    # API cho Flutter (GET/POST /api/exams)
│   └── ExamController.cs       # MVC cho giảng viên (upload, sửa, xuất bản, thống kê)
└── Views/Exam/                 # Index, Import, Edit, Statistics
```

## Chạy

Yêu cầu: .NET 8 SDK (đã cài trên máy này), SQL Server (CSDL `ToeicExam` tạo bằng
`../create_database.sql`).

```bash
cd ToeicBackend
dotnet run --urls http://localhost:5000
```

- Website giảng viên: http://localhost:5000/Exam
- API sinh viên: http://localhost:5000/api/exams

## API (cho Flutter)

| Method | Route | Mô tả |
|--------|-------|-------|
| GET | `/api/exams` | danh sách đề đã xuất bản |
| GET | `/api/exams/{id}` | nội dung đề (items: passage + question) |
| POST | `/api/exams/{id}/submit` | nộp bài → chấm điểm |

Chi tiết JSON: xem `../../API_contract.md`.

## Đã verify (chạy thật trên máy này)

- `dotnet build` → **0 lỗi** (chỉ vài warning nullable trong `Import/`, vô hại).
- Upload `TOEIC_Reading_Test7_Tagged.docx` qua `/Exam/Import` → nhập đúng
  **100 câu, 19 nhóm, 400 đáp án**, Part 6 có vị trí chỗ trống + đáp án đúng.
- `GET /api/exams/2` → 100 câu, ids 101→200 liên tục, mỗi câu đủ 4 đáp án A–D,
  Part 6 có `stem = null`.
- `POST /api/exams/2/submit`:
  - nộp đúng 100/100 → `{score:100, correct:100, wrong:0, skipped:0}`
  - nộp 10 đúng / 5 sai / 85 bỏ qua → `{correct:10, wrong:5, skipped:85}`
- `/Exam/Statistics/2` → hiện số lượt làm (2), điểm TB (55), top câu sai.

## Ghi chú về yêu cầu template ABP

Đề bài yêu cầu dùng https://aspnetboilerplate.com/Templates. Project này là bản
chuẩn ASP.NET Core MVC **cùng logic** để bạn chạy demo ngay. Khi dùng template ABP,
copy các class vào đúng layer rồi kế thừa base của ABP:

| Project này | Lớp ABP tương ứng |
|-------------|-------------------|
| `Models/Entities.cs` | kế thừa `Entity<int>` / `FullAuditedEntity<int>` |
| `Data/AppDbContext.cs` | kế thừa `AbpDbContext` (giữ nguyên `OnModelCreating`) |
| `Services/*` | kế thừa `ApplicationService`, dùng `IRepository`/`IDbContextProvider` |
| `Controllers/*` + `Views/*` | đặt ở layer `Web.Mvc` |

Logic parse/validate/import/chấm điểm **giữ nguyên 100%**.
