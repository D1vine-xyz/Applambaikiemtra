// EF Core entities — khớp 6 bang trong create_database.sql.
// (Trong ABP: cho cac class nay ke thua Entity<int> / FullAuditedEntity<int>.)
namespace ToeicBackend.Models;

public class Exam
{
    public int Id { get; set; }
    public string Title { get; set; } = "";
    public int TimeLimitMinutes { get; set; } = 75;
    public bool IsPublished { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public List<QuestionGroup> Groups { get; set; } = new();
    public List<Question> Questions { get; set; } = new();
}

public class QuestionGroup
{
    public int Id { get; set; }
    public int ExamId { get; set; }
    public Exam Exam { get; set; } = null!;
    public int Part { get; set; }
    public string? PassageText { get; set; }
    public int OrderIndex { get; set; }
    public bool ShuffleQuestions { get; set; }

    public List<Question> Questions { get; set; } = new();
}

public class Question
{
    public int Id { get; set; }
    public int ExamId { get; set; }
    public Exam Exam { get; set; } = null!;
    public int? GroupId { get; set; }
    public QuestionGroup? Group { get; set; }
    public int Part { get; set; }
    public int QuestionNumber { get; set; }
    public string? StemText { get; set; }
    public int? GapPosition { get; set; }
    public string CorrectOptionKey { get; set; } = ""; // A/B/C/D
    public string? Hint { get; set; }
    public bool ShuffleAnswers { get; set; }
    public int OrderIndex { get; set; }

    public List<AnswerOption> Options { get; set; } = new();
}

public class AnswerOption
{
    public int Id { get; set; }
    public int QuestionId { get; set; }
    public Question Question { get; set; } = null!;
    public string OptionKey { get; set; } = ""; // A/B/C/D
    public string OptionText { get; set; } = "";
    public int OrderIndex { get; set; }
}

public class ExamAttempt
{
    public int Id { get; set; }
    public int ExamId { get; set; }
    public string StudentId { get; set; } = "";
    public DateTime StartTime { get; set; } = DateTime.UtcNow;
    public DateTime? EndTime { get; set; }
    public int? Score { get; set; }

    public List<StudentAnswer> Answers { get; set; } = new();
}

public class StudentAnswer
{
    public int Id { get; set; }
    public int AttemptId { get; set; }
    public ExamAttempt Attempt { get; set; } = null!;
    public int QuestionId { get; set; }
    public Question Question { get; set; } = null!;
    public string? SelectedKey { get; set; } // A/B/C/D, null = bo qua
    public DateTime AnsweredAt { get; set; } = DateTime.UtcNow;
}
