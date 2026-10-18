// Truy van + cham diem + thong ke.
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using ToeicBackend.Data;
using ToeicBackend.Dtos;
using ToeicBackend.Models;

namespace ToeicBackend.Services;

public class ExamQueryService
{
    private readonly AppDbContext _db;
    private readonly IMemoryCache? _cache;
    private const string DashboardCacheKey = "DashboardStats";

    public ExamQueryService(AppDbContext db, IMemoryCache? cache = null)
    {
        _db = db;
        _cache = cache;
    }

    // ---------- danh sach de ----------
    public async Task<List<ExamSummaryDto>> GetExamsAsync(bool publishedOnly)
    {
        IQueryable<Exam> q = _db.Exam.AsNoTracking();
        if (publishedOnly) q = q.Where(e => e.IsPublished);

        return await q.Select(e => new ExamSummaryDto
        {
            Id = e.Id,
            Title = e.Title,
            TimeLimitMinutes = e.TimeLimitMinutes,
            QuestionCount = e.Questions.Count,
            IsPublished = e.IsPublished,
        }).ToListAsync();
    }

    // ---------- noi dung de (cho sinh vien thi) ----------
    public async Task<ExamContentDto?> GetExamContentAsync(int examId)
    {
        var exam = await _db.Exam.AsNoTracking()
            .FirstOrDefaultAsync(e => e.Id == examId && e.IsPublished);
        if (exam == null) return null;

        var dto = new ExamContentDto
        {
            Id = exam.Id,
            Title = exam.Title,
            TimeLimitMinutes = exam.TimeLimitMinutes,
        };

        // Part 5 (cau doc lap)
        var part5 = await _db.Question.AsNoTracking()
            .Where(q => q.ExamId == examId && q.Part == 5)
            .Include(q => q.Options)
            .OrderBy(q => q.QuestionNumber)
            .ToListAsync();
        foreach (var q in part5)
            dto.Items.Add(ToQuestionItem(q));

        // Part 6/7 (nhom: passage truoc, cau hoi sau) - AsSplitQuery tranh Cartesian explosion
        var groups = await _db.QuestionGroup.AsNoTracking()
            .Where(g => g.ExamId == examId)
            .Include(g => g.Questions).ThenInclude(q => q.Options)
            .OrderBy(g => g.Part).ThenBy(g => g.OrderIndex)
            .AsSplitQuery()
            .ToListAsync();
        foreach (var g in groups)
        {
            dto.Items.Add(new ExamItemDto
            {
                Type = "passage",
                GroupId = g.Id,
                Part = g.Part,
                Text = g.PassageText,
            });
            foreach (var q in g.Questions.OrderBy(q => q.QuestionNumber))
                dto.Items.Add(ToQuestionItem(q));
        }

        return dto;
    }

    private static ExamItemDto ToQuestionItem(Question q) => new()
    {
        Type = "question",
        Id = q.QuestionNumber,
        Part = q.Part,
        Stem = q.StemText,
        Options = q.Options.OrderBy(o => o.OrderIndex)
            .Select(o => new OptionDto { Key = o.OptionKey, Text = o.OptionText })
            .ToList(),
    };

    // ---------- xem truoc de thi (tieu chi b) ----------
    public async Task<PreviewExamDto?> GetPreviewAsync(int examId)
    {
        var exam = await _db.Exam.AsNoTracking().FirstOrDefaultAsync(e => e.Id == examId);
        if (exam == null) return null;

        var dto = new PreviewExamDto
        {
            Title = exam.Title,
            TimeLimitMinutes = exam.TimeLimitMinutes,
        };

        var part5 = await _db.Question.AsNoTracking()
            .Where(q => q.ExamId == examId && q.Part == 5)
            .Include(q => q.Options)
            .OrderBy(q => q.QuestionNumber)
            .ToListAsync();
        foreach (var q in part5)
            dto.Items.Add(ToPreviewItem(q));
        dto.QuestionCount += part5.Count;

        var groups = await _db.QuestionGroup.AsNoTracking()
            .Where(g => g.ExamId == examId)
            .Include(g => g.Questions).ThenInclude(q => q.Options)
            .OrderBy(g => g.Part).ThenBy(g => g.OrderIndex)
            .AsSplitQuery()
            .ToListAsync();
        foreach (var g in groups)
        {
            dto.Items.Add(new PreviewItemDto { Kind = "passage", Part = g.Part, PassageText = g.PassageText });
            foreach (var q in g.Questions.OrderBy(q => q.QuestionNumber))
            {
                dto.Items.Add(ToPreviewItem(q));
                dto.QuestionCount++;
            }
        }
        return dto;
    }

    private static PreviewItemDto ToPreviewItem(Question q) => new()
    {
        Kind = "question",
        Number = q.QuestionNumber,
        Part = q.Part,
        Stem = q.StemText,
        CorrectKey = q.CorrectOptionKey,
        Hint = q.Hint,
        Options = q.Options.OrderBy(o => o.OrderIndex)
            .Select(o => new OptionDto { Key = o.OptionKey, Text = o.OptionText })
            .ToList(),
    };

    // ---------- nop bai + cham diem ----------
    public async Task<ExamResultDto?> SubmitAsync(int examId, SubmitRequestDto req, string studentId = "anonymous")
    {
        var exam = await _db.Exam.AsNoTracking().FirstOrDefaultAsync(e => e.Id == examId && e.IsPublished);
        if (exam == null) return null;

        // Preload danh sach cau hoi (Id + CorrectOptionKey) vao RAM 1 lan duy nhat (tranh N+1 query)
        var questions = await _db.Question.AsNoTracking()
            .Where(q => q.ExamId == examId)
            .Select(q => new { q.QuestionNumber, q.Id, q.CorrectOptionKey })
            .ToListAsync();

        var keyMap = questions.ToDictionary(q => q.QuestionNumber, q => q.CorrectOptionKey);
        var idMap = questions.ToDictionary(q => q.QuestionNumber, q => q.Id);

        int correct = 0, wrong = 0, skipped = 0;
        var review = new List<AnswerReviewDto>();
        foreach (var a in req.Answers)
        {
            keyMap.TryGetValue(a.Id, out var correctKey);
            review.Add(new AnswerReviewDto { Id = a.Id, CorrectKey = correctKey, StudentKey = a.Key });
            if (a.Key == null) { skipped++; continue; }
            if (correctKey == a.Key) correct++;
            else wrong++;
        }

        // luu luot thi
        var attempt = new ExamAttempt
        {
            ExamId = examId,
            StudentId = studentId,
            EndTime = DateTime.UtcNow,
            Score = correct,
        };
        foreach (var a in req.Answers)
        {
            if (idMap.TryGetValue(a.Id, out var qId))
            {
                attempt.Answers.Add(new StudentAnswer
                {
                    QuestionId = qId,
                    SelectedKey = a.Key,
                    AnsweredAt = DateTime.UtcNow,
                });
            }
        }
        _db.ExamAttempt.Add(attempt);
        await _db.SaveChangesAsync();

        _cache?.Remove(DashboardCacheKey);

        return new ExamResultDto
        {
            Score = correct,
            Correct = correct,
            Wrong = wrong,
            Skipped = skipped,
            Total = req.Answers.Count,
            Review = review,
        };
    }

    // ---------- thong ke tong quan (dashboard) ----------
    public async Task<DashboardStatsDto> GetDashboardStatsAsync()
    {
        if (_cache != null && _cache.TryGetValue(DashboardCacheKey, out DashboardStatsDto? cached) && cached != null)
        {
            return cached;
        }

        var examStats = await _db.Exam.AsNoTracking()
            .GroupBy(_ => 1)
            .Select(g => new
            {
                TotalExams = g.Count(),
                PublishedExams = g.Count(e => e.IsPublished)
            })
            .FirstOrDefaultAsync();

        var totalQuestions = await _db.Question.AsNoTracking().CountAsync();
        var totalAttempts = await _db.ExamAttempt.AsNoTracking().CountAsync();

        var stats = new DashboardStatsDto
        {
            TotalExams = examStats?.TotalExams ?? 0,
            PublishedExams = examStats?.PublishedExams ?? 0,
            TotalQuestions = totalQuestions,
            TotalAttempts = totalAttempts,
        };

        _cache?.Set(DashboardCacheKey, stats, TimeSpan.FromSeconds(15));
        return stats;
    }

    // ---------- thong ke (giang vien) ----------
    public async Task<StatisticsDto?> GetStatisticsAsync(int examId)
    {
        var exam = await _db.Exam.FirstOrDefaultAsync(e => e.Id == examId);
        if (exam == null) return null;

        var attempts = await _db.ExamAttempt
            .Where(a => a.ExamId == examId)
            .ToListAsync();

        var topWrong = await _db.StudentAnswer
            .Where(a => a.Attempt.ExamId == examId
                        && a.SelectedKey != null
                        && a.SelectedKey != a.Question.CorrectOptionKey)
            .GroupBy(a => new { a.Question.QuestionNumber, a.Question.Part })
            .Select(g => new QuestionStatDto { QuestionNumber = g.Key.QuestionNumber, Part = g.Key.Part, WrongCount = g.Count() })
            .OrderByDescending(x => x.WrongCount)
            .ThenBy(x => x.QuestionNumber)
            .Take(10)
            .ToListAsync();

        double avg = attempts.Count > 0 ? attempts.Where(a => a.Score.HasValue).Select(a => (double)a.Score!.Value).DefaultIfEmpty(0).Average() : 0;

        // tinh ty le sai theo so luot thi
        int totalAttempts = attempts.Count;
        foreach (var q in topWrong)
            q.WrongRate = totalAttempts > 0 ? Math.Round(q.WrongCount * 100.0 / totalAttempts, 1) : 0;

        // phan bo diem so theo cac moc
        var buckets = new int[10];
        foreach (var a in attempts.Where(a => a.Score.HasValue))
            buckets[Math.Min(9, a.Score!.Value / 10)]++;
        string[] labels = { "0-9", "10-19", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89", "90-100" };
        var dist = new List<ScoreBucketDto>();
        for (int i = 0; i < 10; i++)
            dist.Add(new ScoreBucketDto { Label = labels[i], Count = buckets[i] });

        return new StatisticsDto
        {
            ExamId = examId,
            Title = exam.Title,
            AttemptCount = attempts.Count,
            AverageScore = Math.Round(avg, 1),
            TopWrongQuestions = topWrong,
            ScoreDistribution = dist,
        };
    }

    // ---------- xuat ban / huy ----------
    public async Task<bool> SetPublishedAsync(int examId, bool published)
    {
        var exam = await _db.Exam.FindAsync(examId);
        if (exam == null) return false;
        exam.IsPublished = published;
        await _db.SaveChangesAsync();
        _cache?.Remove(DashboardCacheKey);
        return true;
    }

    // ---------- xoa de thi (cascade) ----------
    public async Task<bool> DeleteExamAsync(int examId)
    {
        if (!await _db.Exam.AnyAsync(e => e.Id == examId)) return false;

        // xoa dung thu tu de khong vi pham khoa ngoai
        var attemptIds = await _db.ExamAttempt.Where(a => a.ExamId == examId)
            .Select(a => a.Id).ToListAsync();
        if (attemptIds.Count > 0)
            await _db.StudentAnswer.Where(s => attemptIds.Contains(s.AttemptId)).ExecuteDeleteAsync();
        await _db.ExamAttempt.Where(a => a.ExamId == examId).ExecuteDeleteAsync();

        var questionIds = await _db.Question.Where(q => q.ExamId == examId)
            .Select(q => q.Id).ToListAsync();
        if (questionIds.Count > 0)
            await _db.AnswerOption.Where(o => questionIds.Contains(o.QuestionId)).ExecuteDeleteAsync();
        await _db.Question.Where(q => q.ExamId == examId).ExecuteDeleteAsync();
        await _db.QuestionGroup.Where(g => g.ExamId == examId).ExecuteDeleteAsync();
        await _db.Exam.Where(e => e.Id == examId).ExecuteDeleteAsync();

        _cache?.Remove(DashboardCacheKey);
        return true;
    }

    // ---------- lay du lieu chinh sua (tieu chi 4) ----------
    public async Task<List<Question>> GetQuestionsForEditAsync(int examId)
    {
        return await _db.Question.AsNoTracking()
            .Where(q => q.ExamId == examId)
            .Include(q => q.Options)
            .OrderBy(q => q.QuestionNumber)
            .AsSplitQuery()
            .ToListAsync();
    }

    public async Task<bool> UpdateQuestionAsync(int examId, int questionNumber,
        string? stem, string correctKey, string? hint,
        string optionA, string optionB, string optionC, string optionD)
    {
        var q = await _db.Question
            .Include(x => x.Options)
            .FirstOrDefaultAsync(x => x.ExamId == examId && x.QuestionNumber == questionNumber);
        if (q == null) return false;

        q.StemText = stem;
        q.CorrectOptionKey = correctKey;
        q.Hint = hint;
        foreach (var o in q.Options.OrderBy(x => x.OptionKey))
        {
            o.OptionText = o.OptionKey switch
            {
                "A" => optionA,
                "B" => optionB,
                "C" => optionC,
                "D" => optionD,
                _ => o.OptionText,
            };
        }
        await _db.SaveChangesAsync();
        return true;
    }
}
