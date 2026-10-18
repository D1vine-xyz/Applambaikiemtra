// ============================================================
//  ExamImport — Entity/POCO (tuong ung 6 bang trong create_database.sql)
//  Luu y: trong ASP.NET Boilerplate, cho cac lop nay ke thua
//  Entity<int> / FullAuditedEntity<int> cua ABP thay vi POCO thuan.
//  Khong gian ten: ExamImport (ban co the doi theo project cua minh).
// ============================================================
namespace ExamImport
{
    public class Exam
    {
        public string Title { get; set; }
        public int TimeLimitMinutes { get; set; } = 75;
        public bool IsPublished { get; set; }

        // Part 5: cau hoi doc lap (khong co bai doc)
        public List<Question> Part5Questions { get; set; } = new();
        // Part 6 + Part 7: nhom bai doc
        public List<QuestionGroup> Groups { get; set; } = new();
    }

    public class QuestionGroup
    {
        public int Id { get; set; }          // so dau tien cua nhom (vd 131)
        public int Part { get; set; }        // 6 hoac 7
        public string PassageText { get; set; }
        public bool ShuffleQuestions { get; set; }
        public List<Question> Questions { get; set; } = new();
        // Part 6: vi tri cac cho trong [GAP:n] trong PassageText
        public List<int> Gaps { get; set; } = new();
    }

    public class Question
    {
        public int Number { get; set; }      // 101..200
        public int Part { get; set; }        // 5 / 6 / 7
        public string StemText { get; set; }  // [QTEXT] (Part 6 de null)
        public Dictionary<string, string> Options { get; set; } = new(); // A..D -> text
        public string CorrectOptionKey { get; set; } // A/B/C/D
        public string Hint { get; set; }
        public bool ShuffleQuestions { get; set; }
        public bool ShuffleAnswers { get; set; }
    }
}
