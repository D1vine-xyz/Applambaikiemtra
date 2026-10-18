// DTO cho API (frontend Flutter) va cho cac view MVC.
namespace ToeicBackend.Dtos;

public class ExamSummaryDto
{
    public int Id { get; set; }
    public string Title { get; set; } = "";
    public int TimeLimitMinutes { get; set; }
    public int QuestionCount { get; set; }
    public bool IsPublished { get; set; }
}

public class OptionDto
{
    public string Key { get; set; } = "";
    public string Text { get; set; } = "";
}

public class ExamItemDto
{
    public string Type { get; set; } = ""; // "passage" | "question"
    public int? Id { get; set; }           // question: so cau
    public int? Part { get; set; }
    public string? Stem { get; set; }
    public List<OptionDto>? Options { get; set; }
    public int? GroupId { get; set; }      // passage
    public string? Text { get; set; }      // passage
}

public class ExamContentDto
{
    public int Id { get; set; }
    public string Title { get; set; } = "";
    public int TimeLimitMinutes { get; set; }
    public List<ExamItemDto> Items { get; set; } = new();
}

public class AnswerItemDto
{
    public int Id { get; set; }
    public string? Key { get; set; }
}

public class SubmitRequestDto
{
    public List<AnswerItemDto> Answers { get; set; } = new();
}

public class ExamResultDto
{
    public int Score { get; set; }
    public int Correct { get; set; }
    public int Wrong { get; set; }
    public int Skipped { get; set; }
    public int Total { get; set; }
    // danh sach dap an dung + lua chon cua sinh vien (khong kem goi y/giai thich)
    public List<AnswerReviewDto> Review { get; set; } = new();
}

public class AnswerReviewDto
{
    public int Id { get; set; }           // so cau (QuestionNumber)
    public string? CorrectKey { get; set; } // A/B/C/D
    public string? StudentKey { get; set; } // lua chon cua sinh vien (null = bo qua)
}

public class QuestionStatDto
{
    public int QuestionNumber { get; set; }
    public int Part { get; set; }
    public int WrongCount { get; set; }
    public double WrongRate { get; set; }
}

public class StatisticsDto
{
    public int ExamId { get; set; }
    public string Title { get; set; } = "";
    public int AttemptCount { get; set; }
    public double AverageScore { get; set; }
    public List<QuestionStatDto> TopWrongQuestions { get; set; } = new();
    public List<ScoreBucketDto> ScoreDistribution { get; set; } = new();
}

public class ScoreBucketDto
{
    public string Label { get; set; } = "";
    public int Count { get; set; }
}

// ---- Xem truoc de thi (tieu chi b) ----
public class PreviewItemDto
{
    public string Kind { get; set; } = ""; // "passage" | "question"
    public int Number { get; set; }
    public int Part { get; set; }
    public string? Stem { get; set; }
    public string? CorrectKey { get; set; }
    public string? Hint { get; set; }
    public string? PassageText { get; set; }
    public List<OptionDto> Options { get; set; } = new();
}

public class PreviewExamDto
{
    public string Title { get; set; } = "";
    public int TimeLimitMinutes { get; set; }
    public int QuestionCount { get; set; }
    public List<PreviewItemDto> Items { get; set; } = new();
}

// ---- Thong ke tong quan (dashboard) ----
public class DashboardStatsDto
{
    public int TotalExams { get; set; }
    public int PublishedExams { get; set; }
    public int TotalQuestions { get; set; }
    public int TotalAttempts { get; set; }
}
