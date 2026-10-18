// ============================================================
//  ExamImport — Doc thanh .docx co gan tag + validate 7 quy tac.
//  Tuong duong C# cua backend/parse_and_validate.py (da chay dung).
//
//  LUU Y: ban C# nay CHUA duoc compile tren may nay (thieu dotnet SDK).
//  Logic da duoc chung minh bang ban Python. Can NuGet package:
//      DocumentFormat.OpenXml
//
//  Cach dung (trong controller/service):
//      var result = ExamDocxParser.Parse(fileStream);
//      if (!result.Success)  -> tra loi cac result.Errors, KHONG luu DB.
//      else                  -> map result.Exam vao Exam/QuestionGroup/Question/AnswerOption.
// ============================================================
using System.Text.RegularExpressions;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;

namespace ExamImport
{
    public class ParseResult
    {
        public Exam Exam { get; set; }
        public List<string> Errors { get; set; } = new();
        public bool Success => Errors.Count == 0;
    }

    public static class ExamDocxParser
    {
        // ---- regex (giong ban Python) ----
        private static readonly Regex ReTitle   = new(@"^\[EXAM:TITLE\](.*)\[/EXAM:TITLE\]$");
        private static readonly Regex ReTime    = new(@"^\[EXAM:TIME\](\d+)\[/EXAM:TIME\]$");
        private static readonly Regex RePart    = new(@"^\[PART:([567])\]$");
        private static readonly Regex ReQOpen   = new(@"^\[Q:(\d+)\]$");
        private static readonly Regex ReQClose  = new(@"^\[/Q:(\d+)\]$");
        private static readonly Regex ReGrpOpen = new(@"^\[GROUP:(\d+)\]$");
        private static readonly Regex ReGrpClose = new(@"^\[/GROUP:(\d+)\]$");
        private static readonly Regex ReQtext   = new(@"^\[QTEXT\](.*)\[/QTEXT\]$");
        private static readonly Regex ReOpt     = new(@"^\[OPTION:([A-D])\](.*)\[/OPTION:\1\]$");
        private static readonly Regex ReAns     = new(@"^\[ANSWER\]([A-D])\[/ANSWER\]$");
        private static readonly Regex ReHint    = new(@"^\[HINT\](.*)\[/HINT\]$");
        private static readonly Regex ReShQ     = new(@"^\[SHUFFLE_Q\](yes|no)\[/SHUFFLE_Q\]$");
        private static readonly Regex ReShA     = new(@"^\[SHUFFLE_A\](yes|no)\[/SHUFFLE_A\]$");
        private static readonly Regex ReGap     = new(@"\[GAP:(\d+)\]");

        public static ParseResult Parse(Stream stream)
        {
            var result = new ParseResult();
            var exam = new Exam();
            var lines = ReadLines(stream);

            int? curPart = null;
            QuestionGroup curGroup = null;
            Question curQ = null;
            bool inPassage = false;
            var partsSeen = new HashSet<int>();

            for (int i = 0; i < lines.Count; i++)
            {
                string line = lines[i].Trim();
                void Err(string msg) => result.Errors.Add($"dong {i + 1}: {msg}");

                Match m;
                if ((m = ReTitle.Match(line)).Success) { exam.Title = m.Groups[1].Value; continue; }
                if ((m = ReTime.Match(line)).Success)  { exam.TimeLimitMinutes = int.Parse(m.Groups[1].Value); continue; }
                if ((m = RePart.Match(line)).Success)
                {
                    curPart = int.Parse(m.Groups[1].Value);
                    partsSeen.Add(curPart.Value);
                    curGroup = null; curQ = null; inPassage = false;
                    continue;
                }
                if (line == "[PASSAGE]")  { if (curGroup == null) Err("[PASSAGE] nam ngoai [GROUP]"); inPassage = true; continue; }
                if (line == "[/PASSAGE]") { inPassage = false; continue; }
                if ((m = ReGrpOpen.Match(line)).Success)
                {
                    curGroup = new QuestionGroup { Id = int.Parse(m.Groups[1].Value), Part = curPart ?? 0 };
                    curQ = null;
                    continue;
                }
                if ((m = ReGrpClose.Match(line)).Success)
                {
                    if (curGroup == null) Err("[/GROUP] khong co [GROUP] tuong ung");
                    else { exam.Groups.Add(curGroup); curGroup = null; }
                    continue;
                }
                if ((m = ReQOpen.Match(line)).Success)
                {
                    int num = int.Parse(m.Groups[1].Value);
                    curQ = new Question { Number = num, Part = curPart ?? 0 };
                    if (curPart is 6 or 7)
                    {
                        if (curGroup == null) Err($"[Q:{num}] nam ngoai [GROUP]");
                        else curGroup.Questions.Add(curQ);
                    }
                    else if (curPart == 5) exam.Part5Questions.Add(curQ);
                    else Err($"[Q:{num}] nam ngoai PART hop le");
                    continue;
                }
                if (ReQClose.IsMatch(line)) { curQ = null; continue; }
                if ((m = ReQtext.Match(line)).Success) { Set(curQ, () => curQ.StemText = m.Groups[1].Value, "[QTEXT] ngoai cau hoi", Err); continue; }
                if ((m = ReOpt.Match(line)).Success)
                {
                    if (curQ == null) Err($"[OPTION:{m.Groups[1].Value}] ngoai cau hoi");
                    else curQ.Options[m.Groups[1].Value] = m.Groups[2].Value;
                    continue;
                }
                if ((m = ReAns.Match(line)).Success) { Set(curQ, () => curQ.CorrectOptionKey = m.Groups[1].Value, "[ANSWER] ngoai cau hoi", Err); continue; }
                if ((m = ReHint.Match(line)).Success) { Set(curQ, () => curQ.Hint = m.Groups[1].Value, "[HINT] ngoai cau hoi", Err); continue; }
                if ((m = ReShQ.Match(line)).Success)  { Set(curQ, () => curQ.ShuffleQuestions = m.Groups[1].Value == "yes", "[SHUFFLE_Q] ngoai cau hoi", Err); continue; }
                if ((m = ReShA.Match(line)).Success)  { Set(curQ, () => curQ.ShuffleAnswers = m.Groups[1].Value == "yes", "[SHUFFLE_A] ngoai cau hoi", Err); continue; }

                if (inPassage && curGroup != null)
                {
                    curGroup.PassageText += line + "\n";
                    foreach (Match gm in ReGap.Matches(line))
                        curGroup.Gaps.Add(int.Parse(gm.Groups[1].Value));
                    continue;
                }
                Err($"dong khong nhan dien duoc: {line}");
            }

            result.Exam = exam;
            Validate(exam, partsSeen, result.Errors);
            return result;
        }

        private static void Set(Question q, Action assign, string errMsg, Action<string> err)
        {
            if (q == null) err(errMsg);
            else assign();
        }

        private static List<string> ReadLines(Stream stream)
        {
            var lines = new List<string>();
            using var doc = WordprocessingDocument.Open(stream, false);
            var body = doc.MainDocumentPart?.Document?.Body;
            if (body == null) return lines;
            foreach (var p in body.Elements<Paragraph>())
            {
                string text = p.InnerText.Trim();
                if (text.Length > 0) lines.Add(text);
            }
            return lines;
        }

        // ---- 7 quy tac validate (muc A.7) ----
        private static void Validate(Exam exam, HashSet<int> partsSeen, List<string> errors)
        {
            if (string.IsNullOrWhiteSpace(exam.Title)) errors.Add("thieu [EXAM:TITLE]");
            if (exam.TimeLimitMinutes <= 0) errors.Add("thieu [EXAM:TIME]");
            foreach (int p in new[] { 5, 6, 7 })
                if (!partsSeen.Contains(p)) errors.Add($"thieu [PART:{p}]");

            var all = new List<Question>();
            all.AddRange(exam.Part5Questions);
            foreach (var g in exam.Groups) all.AddRange(g.Questions);

            var ids = all.Select(q => q.Number).OrderBy(x => x).ToList();
            var expected = Enumerable.Range(101, 100).ToList();
            if (!ids.SequenceEqual(expected))
            {
                var missing = expected.Except(ids).ToList();
                var dupes = ids.GroupBy(x => x).Where(g => g.Count() > 1).Select(g => g.Key).ToList();
                errors.Add($"so cau/so thu tu sai: {ids.Count} cau, " +
                           $"thieu=[{string.Join(",", missing)}], trung=[{string.Join(",", dupes)}]");
            }

            foreach (var q in all)
            {
                foreach (var key in new[] { "A", "B", "C", "D" })
                    if (!q.Options.TryGetValue(key, out var v) || string.IsNullOrEmpty(v))
                        errors.Add($"cau {q.Number}: thieu OPTION:{key}");
                if (q.CorrectOptionKey is not ("A" or "B" or "C" or "D"))
                    errors.Add($"cau {q.Number}: ANSWER khong hop le ({q.CorrectOptionKey})");
                if (string.IsNullOrWhiteSpace(q.Hint)) errors.Add($"cau {q.Number}: thieu HINT");
                // SHUFFLE flags da duoc regex bao dam yes/no (neu thieu dong thi khong set)
                if (q.Part == 7 && string.IsNullOrWhiteSpace(q.StemText))
                    errors.Add($"cau {q.Number} (Part 7): thieu QTEXT");
            }

            foreach (var g in exam.Groups)
            {
                if (g.Part == 6)
                {
                    var gq = g.Questions.Select(q => q.Number).OrderBy(x => x).ToList();
                    var gaps = g.Gaps.OrderBy(x => x).ToList();
                    if (!gq.SequenceEqual(gaps))
                        errors.Add($"GROUP {g.Id} (Part 6): GAP [{string.Join(",", gaps)}] " +
                                   $"khong khop cau hoi [{string.Join(",", gq)}]");
                }
            }
        }
    }
}
