# Thiết kế bộ Tag chuẩn + Cơ sở dữ liệu — Ứng dụng thi TOEIC Reading

> Áp dụng cho đề **TOEIC Reading Test 7** (file `TOEIC_Reading_Test7_Tagged.docx`).
> Mục đích: backend (ASP.NET MVC + SQL Server) đọc file `.docx`, parse theo tag, và
> **hủy toàn bộ nếu file không đúng chuẩn 100%** (thiếu tag, thiếu đáp án, sai số thứ tự câu).

---

## Phần A — Định nghĩa bộ Tag chuẩn

### A.1. Nguyên tắc chung

1. Mỗi tag nằm trên **một dòng riêng** (một paragraph trong Word) để dễ parse.
2. Tag mở và tag đóng luôn đi thành cặp, ví dụ `[QTEXT]…[/QTEXT]`.
3. Thứ tự bắt buộc trong một khối câu hỏi là cố định (xem bên dưới).
4. Mã câu hỏi là số nguyên duy nhất, liên tục từ 101 → 200.
5. Chỉ nhận 4 lựa chọn `A`, `B`, `C`, `D`; đáp án đúng chỉ được là một trong `A/B/C/D`.

### A.2. Tag cấp đề thi (meta)

| Tag | Ý nghĩa | Ví dụ |
|-----|---------|-------|
| `[EXAM:TITLE]…[/EXAM:TITLE]` | Tên đề | `TOEIC Reading Test 7` |
| `[EXAM:TIME]…[/EXAM:TIME]` | Thời gian làm bài (phút) | `75` |

### A.3. Tag cấp phần thi

| Tag | Ý nghĩa |
|-----|---------|
| `[PART:5]` | Bắt đầu Part 5 (Incomplete Sentences) |
| `[PART:6]` | Bắt đầu Part 6 (Text Completion) |
| `[PART:7]` | Bắt đầu Part 7 (Reading Comprehension) |

### A.4. Tag khối câu hỏi (áp dụng cho cả 3 Part)

| Tag | Bắt buộc | Ý nghĩa (map với yêu cầu đề bài) |
|-----|:---:|---------|
| `[Q:101]` … `[/Q:101]` | ✅ | Mở/đóng khối câu hỏi, mang số thứ tự câu |
| `[QTEXT]…[/QTEXT]` | Part 5, 7 | Nội dung câu hỏi *(yêu cầu a)* |
| `[OPTION:A]…[/OPTION:A]` … `[OPTION:D]…[/OPTION:D]` | ✅ | Nội dung 4 đáp án *(yêu cầu a)* |
| `[ANSWER]…[/ANSWER]` | ✅ | Đáp án đúng *(yêu cầu b)* |
| `[HINT]…[/HINT]` | ✅ | Gợi ý câu trả lời *(yêu cầu c)* |
| `[SHUFFLE_Q]yes[/SHUFFLE_Q]` | ✅ | Cho phép hoán vị **câu hỏi** *(yêu cầu d)* |
| `[SHUFFLE_A]yes[/SHUFFLE_A]` | ✅ | Cho phép hoán vị **đáp án** *(yêu cầu e)* |

> **Lưu ý:** `SHUFFLE_Q`/`SHUFFLE_A` nhận `yes`/`no`. Với Part 5 câu độc lập,
> `SHUFFLE_Q=yes` nghĩa là câu có thể bị đảo thứ tự hiển thị. Với Part 6/7, hoán vị
> câu hỏi **chỉ trong phạm vi nhóm (GROUP) của nó**, không nhảy sang bài đọc khác.

### A.5. Tag nhóm bài đọc (Part 6 & Part 7)

| Tag | Ý nghĩa |
|-----|---------|
| `[GROUP:131]` … `[/GROUP:131]` | Nhóm các câu hỏi thuộc cùng một bài đọc |
| `[PASSAGE]` … `[/PASSAGE]` | Nội dung bài đọc (text/email/bảng/…) |
| `[GAP:131]` | *(chỉ Part 6)* đánh dấu vị trí chỗ trống trong bài đọc, liên kết với câu hỏi cùng số |

### A.6. Ví dụ minh họa

**Part 5 (câu độc lập):**
```
[PART:5]
[Q:101]
[QTEXT]If ------- are not satisfied with an item, return it for a full refund within 30 days of purchase.[/QTEXT]
[OPTION:A]you[/OPTION:A]
[OPTION:B]your[/OPTION:B]
[OPTION:C]yours[/OPTION:C]
[OPTION:D]yourself[/OPTION:D]
[ANSWER]A[/ANSWER]
[HINT]Cần đại từ nhân xưng làm chủ ngữ cho "are not satisfied" → "you".[/HINT]
[SHUFFLE_Q]yes[/SHUFFLE_Q]
[SHUFFLE_A]yes[/SHUFFLE_A]
[/Q:101]
[/PART:5]
```

**Part 6 (điền vào đoạn văn):**
```
[PART:6]
[GROUP:131]
[PASSAGE]
PGD Bank strives [GAP:131] the highest levels of client security and service.
Our three branch offices have proudly been a part of the community [GAP:132] a combined total of 40 years.
[/PASSAGE]
[Q:131]
[OPTION:A]to provide[/OPTION:A]
[OPTION:B]provided[/OPTION:B]
[OPTION:C]providing[/OPTION:C]
[OPTION:D]to be provided[/OPTION:D]
[ANSWER]A[/ANSWER]
[HINT]strive + to V → "strives to provide".[/HINT]
[SHUFFLE_Q]yes[/SHUFFLE_Q]
[SHUFFLE_A]yes[/SHUFFLE_A]
[/Q:131]
[/GROUP:131]
[/PART:6]
```

**Part 7 (đọc hiểu):**
```
[PART:7]
[GROUP:147]
[PASSAGE]
Sedwick Electronics Hiring Event
...
[/PASSAGE]
[Q:147]
[QTEXT]For whom is the advertisement intended?[/QTEXT]
[OPTION:A]Recruiters[/OPTION:A]
[OPTION:B]Job seekers[/OPTION:B]
[OPTION:C]Local business owners[/OPTION:C]
[OPTION:D]Current Sedwick Electronics employees[/OPTION:D]
[ANSWER]B[/ANSWER]
[HINT]Quảng cáo "Hiring Event"... → dành cho người tìm việc.[/HINT]
[SHUFFLE_Q]yes[/SHUFFLE_Q]
[SHUFFLE_A]yes[/SHUFFLE_A]
[/Q:147]
[/GROUP:147]
[/PART:7]
```

### A.7. Quy tắc validate (backend phải kiểm tra, sai là hủy file)

1. Tồn tại đủ `[EXAM:TITLE]` và `[EXAM:TIME]`.
2. Đủ 3 tag `[PART:5]`, `[PART:6]`, `[PART:7]`.
3. Số câu hỏi = 100; số thứ tự **liên tục đúng** từ 101 → 200, không trùng, không thiếu.
4. Mỗi `[Q:n]` có đúng 1 `[ANSWER]` ∈ {A,B,C,D} và đủ 4 `[OPTION:A..D]`.
5. Mỗi câu có đủ `[HINT]`, `[SHUFFLE_Q]`, `[SHUFFLE_A]`.
6. Part 6: số `[GAP:n]` trong `[PASSAGE]` **phải khớp** với số câu hỏi trong `[GROUP]`.
7. Không có tag nào bị mở mà thiếu đóng (cân bằng dấu `[` / `]` và cặp mở/đóng).

---

## Phần B — Thiết kế cơ sở dữ liệu (SQL Server)

### B.1. Vì sao không dùng 1 bảng câu hỏi?

Đề thi có **cấu trúc 3 tầng**:
- **Tầng 1 — Part 5:** câu hỏi độc lập, không có đoạn văn.
- **Tầng 2 — Part 6 & 7:** câu hỏi **nhóm theo đoạn văn** (một bài đọc → nhiều câu hỏi).

Nếu gom hết vào 1 bảng, phần "bài đọc chung" sẽ bị lặp lại ở từng câu hỏi (dư thừa, khó sửa),
và không mô tả được quan hệ "1 bài đọc → N câu hỏi". Vì vậy phải tách bảng.

### B.2. Sơ đồ các bảng

```
Exam (1) ─────< QuestionGroup (N) ─────< Question (N) ─────< AnswerOption (N)
  │                 │                        │
  │                 └── PassageText          │
  │                                          └────< StudentAnswer (N) ──── ExamAttempt
```

### B.3. Chi tiết từng bảng

**1. `Exam` — Đề thi**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK, identity) | |
| Title | nvarchar(200) | `EXAM:TITLE` |
| TimeLimitMinutes | int | `EXAM:TIME` (75) |
| IsPublished | bit | Chỉ khi giảng viên xuất bản |
| CreatedAt | datetime2 | |

**2. `QuestionGroup` — Nhóm bài đọc (Part 6/7). Part 5: mỗi câu là 1 nhóm riêng hoặc GroupId = NULL.**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK) | |
| ExamId | int (FK → Exam) | |
| Part | int | 5 / 6 / 7 |
| PassageText | nvarchar(max) | Nội dung bài đọc (đã thay `[GAP:n]` bằng placeholder) |
| OrderIndex | int | Thứ tự hiển thị nhóm |
| ShuffleQuestions | bit | Từ `[SHUFFLE_Q]` của nhóm |

**3. `Question` — Câu hỏi**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK) | |
| GroupId | int (FK → QuestionGroup) | NULL nếu Part 5 độc lập |
| Part | int | 5 / 6 / 7 |
| QuestionNumber | int | 101…200 (khóa duy nhất trong Exam) |
| StemText | nvarchar(max) | `[QTEXT]` (Part 6 để rỗng, dùng `[GAP]`) |
| GapPosition | int | *(Part 6)* vị trí chỗ trống trong PassageText |
| CorrectOptionKey | char(1) | `[ANSWER]` (A/B/C/D) |
| Hint | nvarchar(max) | `[HINT]` |
| ShuffleAnswers | bit | Từ `[SHUFFLE_A]` |
| OrderIndex | int | Thứ tự câu trong nhóm / đề |

**4. `AnswerOption` — Đáp án của từng câu**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK) | |
| QuestionId | int (FK → Question) | |
| OptionKey | char(1) | A / B / C / D |
| OptionText | nvarchar(max) | Nội dung đáp án |
| OrderIndex | int | Dùng để hoán vị đáp án |

**5. `ExamAttempt` — Lượt làm bài**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK) | |
| ExamId | int (FK → Exam) | |
| StudentId | nvarchar(128) | Người học |
| StartTime | datetime2 | |
| EndTime | datetime2 | NULL khi chưa nộp |
| Score | int | Tổng câu đúng (tính khi chấm) |

**6. `StudentAnswer` — Câu trả lời của thí sinh**
| Cột | Kiểu | Ghi chú |
|-----|------|---------|
| Id | int (PK) | |
| AttemptId | int (FK → ExamAttempt) | |
| QuestionId | int (FK → Question) | |
| SelectedKey | char(1) | A/B/C/D, NULL nếu bỏ qua |
| AnsweredAt | datetime2 | |

### B.4. Cách chấm điểm tự động

```sql
-- Tổng câu đúng của 1 lượt thi
SELECT COUNT(*)
FROM StudentAnswer sa
JOIN Question q ON q.Id = sa.QuestionId
WHERE sa.AttemptId = @attemptId
  AND sa.SelectedKey = q.CorrectOptionKey;
```

Câu bỏ qua = `SelectedKey IS NULL`; câu sai = `SelectedKey <> CorrectOptionKey`.

### B.5. Cách xử lý hoán vị (shuffle)

- **Hoán vị đáp án:** lưu `OrderIndex` trong `AnswerOption`; khi render, sắp xếp theo
  `OrderIndex` (random ở mỗi lượt thi), nhưng `CorrectOptionKey` luôn giữ nguyên theo
  đáp án gốc → chấm điểm không bị sai lệch.
- **Hoán vị câu hỏi:** lưu `OrderIndex` trong `Question`; Part 5 đảo tự do, Part 6/7 chỉ
  đảo trong phạm vi cùng `GroupId` (giữ bài đọc đi kèm câu hỏi của nó).

---

## Phần C — Đối chiếu với tiêu chí chấm

| Tiêu chí | Được đáp ứng bởi |
|----------|------------------|
| 1. File WORD TOEIC (có tag) | `TOEIC_Reading_Test7_Tagged.docx` + Phần A |
| 2. Thiết kế CSDL phù hợp | Phần B (6 bảng, quan hệ 3 tầng) |
| 3–7. Các chức năng app | Dựa trên schema tag + CSDL trên để cài đặt |
