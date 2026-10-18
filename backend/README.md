# Backend — gói import & validate đề thi TOEIC Reading

Thư mục này chứa phần **xử lý dữ liệu đề thi** (không phải project ABP hoàn chỉnh —
bạn tạo project bằng https://aspnetboilerplate.com/Templates rồi gắn các file này vào).

## Các file

| File | Mô tả | Trạng thái |
|------|-------|------------|
| `create_database.sql` | Tạo 6 bảng SQL Server (Exam, QuestionGroup, Question, AnswerOption, ExamAttempt, StudentAnswer) + index + ví dụ chấm điểm | ✅ Đã chạy trên SQL Server 2022 (ToeicExam) |
| `import_to_db.py` | Parse docx → sinh `import_data.sql` (INSERT) | ✅ Đã chạy, nhập đủ 100 câu / 400 đáp án |
| `import_data.sql` | Script INSERT sinh từ `import_to_db.py` | ✅ Đã chạy thành công |
| `parse_and_validate.py` | Parser + validator **tham chiếu** (7 quy tắc) | ✅ Đã chạy đúng cả 2 chiều (file chuẩn pass, file hỏng bị reject) |
| `ExamImport/ExamEntities.cs` | POCO tương ứng 6 bảng | Chưa compile (thiếu dotnet) |
| `ExamImport/ExamDocxParser.cs` | Bản C# của parser (OpenXML) | Chưa compile (thiếu dotnet) — dịch từ bản Python đã verify |

## Cách gắn vào project ABP

1. Tạo project từ template ABP (ASP.NET MVC + EF Core).
2. NuGet: `DocumentFormat.OpenXml` (đọc `.docx`).
3. Copy `ExamImport/` vào project; đổi `namespace ExamImport` theo namespace của bạn.
4. Trong ABP, cho các class `Exam`, `QuestionGroup`, `Question` kế thừa `Entity<int>`
   / `FullAuditedEntity<int>` của ABP thay vì POCO thuần, rồi map sang bảng tương ứng.
5. Controller upload:
   ```csharp
   var result = ExamDocxParser.Parse(file.OpenReadStream());
   if (!result.Success)
       return BadRequest(result.Errors);   // huy toan bo, KHONG luu
   // ... map result.Exam -> Exam/QuestionGroup/Question/AnswerOption -> luu DB
   ```

## Quy tắc validate (khớp mục A.7 trong `Tags_va_CSDL_ThietKe.md`)

1. Đủ `[EXAM:TITLE]`, `[EXAM:TIME]`.
2. Đủ `[PART:5]`, `[PART:6]`, `[PART:7]`.
3. Đủ 100 câu, số thứ tự liên tục 101→200, không trùng/thiếu.
4. Mỗi `[Q:n]` có đúng 1 `[ANSWER]` ∈ {A,B,C,D} và đủ 4 `[OPTION:A..D]`.
5. Mỗi câu có `[HINT]`, `[SHUFFLE_Q]`, `[SHUFFLE_A]`.
6. Part 6: số `[GAP:n]` trong `[PASSAGE]` khớp số câu hỏi trong `[GROUP]`.
7. Mọi tag mở đều có tag đóng tương ứng.

## Kiểm thử nhanh (bản Python đã verify)

```bash
# file chuan -> HOP LE
python3 parse_and_validate.py ../TOEIC_Reading_Test7_Tagged.docx

# tao file hong va chay lai de thay validator bat loi
python3 - <<'EOF'
from docx import Document
d = Document()
for t in ["[EXAM:TITLE]x[/EXAM:TITLE]","[EXAM:TIME]75[/EXAM:TIME]","[PART:5]",
          "[Q:101]","[ANSWER]E[/ANSWER]","[/Q:101]"]:
    d.add_paragraph(t)
d.save("_bad.docx")
EOF
python3 parse_and_validate.py _bad.docx   # -> KHONG HOP LE, liet ke loi
```
