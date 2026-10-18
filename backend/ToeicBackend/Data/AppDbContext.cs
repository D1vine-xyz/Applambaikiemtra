// DbContext — map vao cac bang da tao boi create_database.sql.
using Microsoft.EntityFrameworkCore;
using ToeicBackend.Models;

namespace ToeicBackend.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Exam> Exam => Set<Exam>();
    public DbSet<QuestionGroup> QuestionGroup => Set<QuestionGroup>();
    public DbSet<Question> Question => Set<Question>();
    public DbSet<AnswerOption> AnswerOption => Set<AnswerOption>();
    public DbSet<ExamAttempt> ExamAttempt => Set<ExamAttempt>();
    public DbSet<StudentAnswer> StudentAnswer => Set<StudentAnswer>();

    protected override void OnModelCreating(ModelBuilder b)
    {
        // Ten bang dung voi schema SQL (so it, khong so nhieu)
        b.Entity<Exam>().ToTable("Exam");
        b.Entity<QuestionGroup>().ToTable("QuestionGroup");
        b.Entity<Question>().ToTable("Question");
        b.Entity<AnswerOption>().ToTable("AnswerOption");
        b.Entity<ExamAttempt>().ToTable("ExamAttempt");
        b.Entity<StudentAnswer>().ToTable("StudentAnswer");

        // Question
        b.Entity<Question>()
            .HasOne(q => q.Group)
            .WithMany(g => g.Questions)
            .HasForeignKey(q => q.GroupId)
            .OnDelete(DeleteBehavior.Cascade);

        b.Entity<Question>()
            .HasOne(q => q.Exam)
            .WithMany(e => e.Questions)
            .HasForeignKey(q => q.ExamId)
            .OnDelete(DeleteBehavior.NoAction);

        b.Entity<Question>()
            .HasIndex(q => new { q.ExamId, q.QuestionNumber }).IsUnique();

        // QuestionGroup
        b.Entity<QuestionGroup>()
            .HasOne(g => g.Exam)
            .WithMany(e => e.Groups)
            .HasForeignKey(g => g.ExamId)
            .OnDelete(DeleteBehavior.Cascade);

        // AnswerOption
        b.Entity<AnswerOption>()
            .HasOne(o => o.Question)
            .WithMany(q => q.Options)
            .HasForeignKey(o => o.QuestionId)
            .OnDelete(DeleteBehavior.Cascade);

        // StudentAnswer
        b.Entity<StudentAnswer>()
            .HasOne(a => a.Attempt)
            .WithMany(t => t.Answers)
            .HasForeignKey(a => a.AttemptId)
            .OnDelete(DeleteBehavior.Cascade);

        b.Entity<StudentAnswer>()
            .HasOne(a => a.Question)
            .WithMany()
            .HasForeignKey(a => a.QuestionId)
            .OnDelete(DeleteBehavior.NoAction);

        // Kieu char(1) cho cac cot khoa dap an
        b.Entity<Question>().Property(q => q.CorrectOptionKey).HasColumnType("char(1)");
        b.Entity<AnswerOption>().Property(o => o.OptionKey).HasColumnType("char(1)");
        b.Entity<StudentAnswer>().Property(a => a.SelectedKey).HasColumnType("char(1)");
    }
}
