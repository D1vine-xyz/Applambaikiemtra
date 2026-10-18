// API cho frontend Flutter (theo API_contract.md).
using Microsoft.AspNetCore.Mvc;
using ToeicBackend.Dtos;
using ToeicBackend.Services;

namespace ToeicBackend.Controllers;

[ApiController]
[Route("api/exams")]
public class ExamApiController : ControllerBase
{
    private readonly ExamQueryService _query;

    public ExamApiController(ExamQueryService query) => _query = query;

    // GET /api/exams  (chi de da xuat ban)
    [HttpGet]
    public async Task<IActionResult> List()
        => Ok(await _query.GetExamsAsync(publishedOnly: true));

    // GET /api/exams/{id}
    [HttpGet("{id:int}")]
    public async Task<IActionResult> Content(int id)
    {
        var dto = await _query.GetExamContentAsync(id);
        return dto == null ? NotFound() : Ok(dto);
    }

    // POST /api/exams/{id}/submit
    [HttpPost("{id:int}/submit")]
    public async Task<IActionResult> Submit(int id, [FromBody] SubmitRequestDto req)
    {
        var result = await _query.SubmitAsync(id, req);
        return result == null ? NotFound() : Ok(result);
    }
}
