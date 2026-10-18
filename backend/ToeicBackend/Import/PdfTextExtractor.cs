// Trich text tu PDF (dung PdfPig). Chi can doc text layer — khong OCR.
// PdfPig `page.Text` khong giu ky tu xuong dong, nen nhom Word theo toa do Y
// de dung lai tung dong, roi ghep lai cac dong bi wrap thanh dong logic.
using System.Text.RegularExpressions;
using UglyToad.PdfPig;
using UglyToad.PdfPig.Content;

namespace ExamImport;

public static class PdfTextExtractor
{
    // Dong doc lap: [PART:5], [Q:101], [/Q:101], [GROUP:131], [/GROUP:131], [PASSAGE], [/PASSAGE]
    private static readonly Regex ReStandalone = new(@"^\[/?[A-Z][A-Z0-9:/]*\]$");

    public static List<string> ExtractLines(Stream stream)
    {
        var visual = new List<string>();
        using var pdf = PdfDocument.Open(stream);
        foreach (var page in pdf.GetPages())
        {
            // sort top -> bottom (toa do PDF: Y cao = phia tren)
            var words = page.GetWords().OrderByDescending(w => w.BoundingBox.Bottom).ToList();
            var line = new List<Word>();
            double? curY = null;
            foreach (var w in words)
            {
                if (curY == null || Math.Abs(w.BoundingBox.Bottom - curY.Value) > 3.0)
                {
                    Flush(line, visual);
                    line.Clear();
                    curY = w.BoundingBox.Bottom;
                }
                line.Add(w);
            }
            Flush(line, visual);
        }

        // ghep lai cac dong bi wrap: tag doc lap la ranh gioi dong,
        // dong co cap [TAG]...[/TAG] ghep den khi gap dong [/
        var result = new List<string>();
        var buf = "";
        foreach (var v in visual)
        {
            if (ReStandalone.IsMatch(v))
            {
                if (buf.Length > 0) { result.Add(buf); buf = ""; }
                result.Add(v);
            }
            else if (v.Contains("[/"))
            {
                buf = buf.Length == 0 ? v : buf + " " + v;
                result.Add(buf);
                buf = "";
            }
            else
            {
                buf = buf.Length == 0 ? v : buf + " " + v;
            }
        }
        if (buf.Length > 0) result.Add(buf);
        return result;
    }

    private static void Flush(List<Word> ws, List<string> lines)
    {
        if (ws.Count == 0) return;
        var line = string.Join(" ", ws.OrderBy(w => w.BoundingBox.Left).Select(w => w.Text)).Trim();
        if (line.Length > 0) lines.Add(line);
    }
}
