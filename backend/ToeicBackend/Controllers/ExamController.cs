// Controller MVC cho giang vien (upload, danh sach, xem truoc, sua, xuat ban, thong ke).
using Microsoft.AspNetCore.Mvc;
using ToeicBackend.Dtos;
using ToeicBackend.Services;

namespace ToeicBackend.Controllers;

public class ExamController : Controller
{
    private readonly ExamImportService _import;
    private readonly ExamQueryService _query;

    public ExamController(ExamImportService import, ExamQueryService query)
    {
        _import = import;
        _query = query;
    }

    // Danh sach de (tat ca, khong phan biet xuat ban)
    public async Task<IActionResult> Index()
    {
        ViewBag.Stats = await _query.GetDashboardStatsAsync();
        return View(await _query.GetExamsAsync(publishedOnly: false));
    }

    // Form upload
    public IActionResult Import() => View();

    // Xu ly upload: parse -> validate -> import (huy neu sai)
    [HttpPost]
    public async Task<IActionResult> Import(IFormFile file)
    {
        if (file == null || file.Length == 0)
        {
            ViewData["Error"] = "Chưa chọn file.";
            return View();
        }
        var result = await _import.ImportAsync(file.OpenReadStream(), file.FileName);
        if (!result.Success)
        {
            ViewData["Error"] = "File SAI format — đã hủy, không lưu: " + string.Join(" | ", result.Errors);
            return View();
        }
        ViewData["Ok"] = $"Đã nhập đề thành công (id = {result.ExamId}). Bấm \"Quay lại\" để xem danh sách đề.";
        return View();
    }

    // Xuat ban / huy xuat ban
    [HttpPost]
    public async Task<IActionResult> Publish(int id, bool published)
    {
        await _query.SetPublishedAsync(id, published);
        return RedirectToAction(nameof(Index));
    }

    // Xoa de thi
    [HttpPost]
    public async Task<IActionResult> Delete(int id)
    {
        var ok = await _query.DeleteExamAsync(id);
        TempData[ok ? "Ok" : "Error"] = ok ? "Đã xoá đề thi." : "Không tìm thấy đề thi.";
        return RedirectToAction(nameof(Index));
    }

    // Chinh sua noi dung de (tieu chi 4)
    public async Task<IActionResult> Edit(int id)
    {
        var questions = await _query.GetQuestionsForEditAsync(id);
        if (questions.Count == 0) return RedirectToAction(nameof(Index));
        ViewBag.ExamId = id;
        ViewBag.Title = (await _query.GetExamsAsync(false)).FirstOrDefault(e => e.Id == id)?.Title ?? "";
        return View(questions);
    }

    [HttpPost]
    public async Task<IActionResult> Edit(int id, int questionNumber, string? stem, string correctKey, string? hint,
        string optionA, string optionB, string optionC, string optionD)
    {
        await _query.UpdateQuestionAsync(id, questionNumber, stem, correctKey, hint, optionA, optionB, optionC, optionD);
        return RedirectToAction(nameof(Edit), new { id });
    }

    // Xem truoc de thi (tieu chi b) — ra soat loi chinh ta/noi dung
    public async Task<IActionResult> Preview(int id)
    {
        var dto = await _query.GetPreviewAsync(id);
        if (dto == null) return RedirectToAction(nameof(Index));
        return View(dto);
    }

    // Thong ke (tieu chi d)
    public async Task<IActionResult> Statistics(int id)
    {
        var stats = await _query.GetStatisticsAsync(id);
        if (stats == null) return RedirectToAction(nameof(Index));
        return View(stats);
    }
}
