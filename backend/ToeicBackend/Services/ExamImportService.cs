// Import de thi: parse docx -> validate -> luu vao CSDL (huy toan bo neu sai).
using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using ToeicBackend.Data;
using ToeicBackend.Models;
using Microsoft.Extensions.Caching.Memory;
// (khong `using ExamImport;` de tranh trung ten Exam/Question/QuestionGroup)

namespace ToeicBackend.Services;

public class ImportResult
{
    public bool Success { get; set; }
    public List<string> Errors { get; set; } = new();
    public int ExamId { get; set; }
}

public class ExamImportService
{
    private readonly AppDbContext _db;
    private readonly IMemoryCache? _cache;

    public ExamImportService(AppDbContext db, IMemoryCache? cache = null)
    {
        _db = db;
        _cache = cache;
    }

    private static readonly Regex GapRe = new(@"\[GAP:(\d+)\]");

    public async Task<ImportResult> ImportAsync(Stream stream, string fileName, CancellationToken ct = default)
    {
        // 1. parse + validate (7 quy tac) — tu dong nhan dang .docx / .pdf
        var parsed = fileName.EndsWith(".pdf", StringComparison.OrdinalIgnoreCase)
            ? ExamImport.ExamDocxParser.ParsePdf(stream)
            : ExamImport.ExamDocxParser.Parse(stream);
        if (!parsed.Success)
            return new ImportResult { Success = false, Errors = parsed.Errors };

        var p = parsed.Exam;

        // 2. map parse model -> EF entities
        var exam = new Exam
        {
            Title = p.Title,
            TimeLimitMinutes = p.TimeLimitMinutes,
            IsPublished = false,
        };

        // Part 5: cau doc lap
        foreach (var q in p.Part5Questions)
            exam.Questions.Add(MapQuestion(q, exam, group: null));

        // Part 6/7: nhom
        foreach (var g in p.Groups)
        {
            var group = new QuestionGroup
            {
                Part = g.Part,
                ShuffleQuestions = g.ShuffleQuestions,
                PassageText = ReplaceGaps(g.PassageText),
            };
            foreach (var q in g.Questions)
            {
                var entity = MapQuestion(q, exam, group);
                // GapPosition cho Part 6
                if (g.Part == 6)
                {
                    int idx = (group.PassageText ?? "").IndexOf($"({q.Number}) ____", StringComparison.Ordinal);
                    entity.GapPosition = idx >= 0 ? idx : null;
                }
                group.Questions.Add(entity);
            }
            exam.Groups.Add(group);
        }

        // 3. luu
        await using var tx = await _db.Database.BeginTransactionAsync(ct);
        _db.Exam.Add(exam);
        await _db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);

        _cache?.Remove("DashboardStats");

        return new ImportResult { Success = true, ExamId = exam.Id };
    }

    private static Question MapQuestion(ExamImport.Question q, Exam exam, QuestionGroup? group)
    {
        var entity = new Question
        {
            Exam = exam,
            Group = group,
            Part = q.Part,
            QuestionNumber = q.Number,
            StemText = q.StemText,
            CorrectOptionKey = q.CorrectOptionKey,
            Hint = q.Hint,
            ShuffleAnswers = q.ShuffleAnswers,
            OrderIndex = q.Number,
        };
        foreach (var key in new[] { "A", "B", "C", "D" })
        {
            entity.Options.Add(new AnswerOption
            {
                OptionKey = key,
                OptionText = q.Options.TryGetValue(key, out var t) ? t : "",
                OrderIndex = key[0] - 'A',
            });
        }
        return entity;
    }

    private static string ReplaceGaps(string? passage)
    {
        if (string.IsNullOrEmpty(passage)) return "";
        return GapRe.Replace(passage, m => $"({m.Groups[1].Value}) ____");
    }
}
