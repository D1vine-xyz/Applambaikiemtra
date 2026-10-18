# API Contract — backend ASP.NET ↔ frontend Flutter

File này định nghĩa giao diện chung. Backend (ASP.NET MVC) và frontend (Flutter)
đều phải tuân đúng để nói chuyện được với nhau.

Base URL: `http://<host>:5000` (Android emulator gọi localhost qua `10.0.2.2`).

---

## 1. Danh sách đề thi (dành cho sinh viên)

```
GET /api/exams
```

Trả về mảng đề đã **xuất bản** (IsPublished = 1):

```json
[
  {
    "id": 1,
    "title": "TOEIC Reading Test 7",
    "timeLimitMinutes": 75,
    "questionCount": 100
  }
]
```

---

## 2. Nội dung đề thi (để làm bài)

```
GET /api/exams/{id}
```

Trả về đề gồm danh sách `items` theo **thứ tự hiển thị**. Mỗi item là 1 trong 2 loại:

- `"type": "passage"` — bài đọc (Part 6/7). Chỗ trống Part 6 đã được thay bằng
  `(131) ____`, `(132) ____` (số = số câu hỏi tương ứng).
- `"type": "question"` — câu hỏi. Part 6: `stem` = `null` (câu hỏi nằm ở chỗ trống).

```json
{
  "id": 1,
  "title": "TOEIC Reading Test 7",
  "timeLimitMinutes": 75,
  "items": [
    { "type": "question", "id": 101, "part": 5,
      "stem": "If ------- are not satisfied ...",
      "options": [
        { "key": "A", "text": "you" },
        { "key": "B", "text": "your" },
        { "key": "C", "text": "yours" },
        { "key": "D", "text": "yourself" }
      ] },
    { "type": "passage", "groupId": 131, "part": 6,
      "text": "PGD Bank strives (131) ____ the highest levels ..." },
    { "type": "question", "id": 131, "part": 6, "stem": null,
      "options": [
        { "key": "A", "text": "to provide" },
        { "key": "B", "text": "provided" },
        { "key": "C", "text": "providing" },
        { "key": "D", "text": "to be provided" }
      ] }
  ]
}
```

> **Không trả về** `CorrectOptionKey` và `Hint` ở endpoint này (sinh viên không
> được thấy đáp án/gợi ý khi đang thi).

---

## 3. Nộp bài + chấm điểm tự động

```
POST /api/exams/{id}/submit
```

Body:

```json
{
  "answers": [
    { "id": 101, "key": "A" },
    { "id": 102, "key": null },
    { "id": 131, "key": "B" }
  ]
}
```

(`key` = A/B/C/D, hoặc `null` nếu bỏ qua câu đó.)

Trả về kết quả:

```json
{ "score": 80, "correct": 80, "wrong": 15, "skipped": 5, "total": 100 }
```

Quy tắc chấm: `correct` = số câu `key == CorrectOptionKey`; `wrong` = số câu có
`key` khác đáp án; `skipped` = số câu `key == null`; `score` = `correct`.

---

## 4. Phía Giảng viên (giao diện website MVC — không phải API)

Các trang Razor/Controller phục vụ giảng viên (không nằm trong `/api/`):

| Chức năng | Route (gợi ý) |
|-----------|---------------|
| Upload file `.docx` → validate → import (hủy nếu sai format) | `POST /Exam/Import` |
| Danh sách đề (xem trước, chỉnh sửa, xuất bản) | `GET /Exam` |
| Xem trước / chỉnh sửa nội dung 1 đề | `GET /Exam/Edit/{id}` |
| Xuất bản / hủy xuất bản đề | `POST /Exam/Publish/{id}` |
| Thống kê (số lượt làm, điểm TB, top 10 câu sai) | `GET /Exam/Statistics/{id}` |

---

## Ghi chú hoán vị (shuffle)

- Đáp án (`AnswerOption`) có `OrderIndex` — khi trả về cho sinh viên, backend có
  thể xáo thứ tự đáp án theo `OrderIndex` mỗi lượt thi; `CorrectOptionKey` giữ
  nguyên theo đáp án gốc để chấm không sai.
- Hoán vị câu hỏi (`Question.OrderIndex`): Part 5 đảo tự do, Part 6/7 chỉ đảo
  trong cùng `QuestionGroup` (giữ bài đọc đi kèm câu hỏi của nó).
