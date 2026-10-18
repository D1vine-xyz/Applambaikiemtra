# -*- coding: utf-8 -*-
"""
Import TOEIC_Reading_Test7_Tagged.docx vao SQL Server (bang ToeicExam).
Sinh file import_data.sql (INSERT co IDENTITY_INSERT), sau do chay:
    sqlcmd -S localhost -E -C -d ToeicExam -f 65001 -i import_data.sql
"""
import sys
sys.path.insert(0, ".")
from parse_and_validate import parse, read_lines  # reuse parser

DOCX = r"C:/Giua-ky/TOEIC_Reading_Test7_Tagged.docx"
OUT  = r"C:/Giua-ky/backend/import_data.sql"


def sq(s):
    """SQL string literal (N'...') voi escape dau nhay don."""
    if s is None:
        return "NULL"
    return "N'" + s.replace("'", "''") + "'"


def main():
    exam, errors = parse(read_lines(DOCX))
    if errors:
        print("LOI parse:", errors)
        return 1

    L = []
    L.append("SET NOCOUNT ON;")
    L.append("BEGIN TRANSACTION;")
    # xoa du lieu cu (chay lai an toan)
    L.append("DELETE FROM dbo.StudentAnswer;")
    L.append("DELETE FROM dbo.ExamAttempt;")
    L.append("DELETE FROM dbo.AnswerOption;")
    L.append("DELETE FROM dbo.Question;")
    L.append("DELETE FROM dbo.QuestionGroup;")
    L.append("DELETE FROM dbo.Exam;")

    # 1. Exam
    L.append("SET IDENTITY_INSERT dbo.Exam ON;")
    L.append(f"INSERT INTO dbo.Exam (Id, Title, TimeLimitMinutes, IsPublished) "
             f"VALUES (1, {sq(exam.title)}, {exam.time}, 0);")
    L.append("SET IDENTITY_INSERT dbo.Exam OFF;")

    # 2. Groups (Part 6 truoc, Part 7 sau - theo thu tu docx)
    groups = exam.groups  # Part 6 (4) roi Part 7 (15)
    gid_map = {}  # group object -> id (1..19)
    L.append("SET IDENTITY_INSERT dbo.QuestionGroup ON;")
    for idx, g in enumerate(groups, 1):
        gid_map[id(g)] = idx
        shuffle = 1 if g.part in (6, 7) else 0
        # thay [GAP:n] bang cho trong de hien thi
        import re
        passage = re.sub(r"\[GAP:\d+\]", "_______", g.passage).strip()
        L.append(f"INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) "
                 f"VALUES ({idx}, 1, {g.part}, {sq(passage)}, {idx}, {shuffle});")
    L.append("SET IDENTITY_INSERT dbo.QuestionGroup OFF;")

    # 3. Questions + 4. AnswerOptions (theo thu tu so cau 101..200)
    all_q = exam.part5[:]
    for g in groups:
        all_q += g.questions
    all_q.sort(key=lambda q: q.number)

    # tinh GapPosition cho Part 6
    gap_pos = {}  # question_number -> char index trong passage (da thay gap)
    for g in groups:
        if g.part == 6:
            import re
            # danh sach cac gap theo thu tu xuat hien
            matches = list(re.finditer(r"\[GAP:(\d+)\]", g.passage))
            for m in matches:
                gap_pos[int(m.group(1))] = m.start()

    L.append("SET IDENTITY_INSERT dbo.Question ON;")
    qrows = []
    for q in all_q:
        qid = q.number - 100  # 101 -> 1 ... 200 -> 100
        group_id = None
        if q.part in (6, 7):
            # tim group chua cau nay
            for g in groups:
                if any(qq.number == q.number for qq in g.questions):
                    group_id = gid_map[id(g)]
                    break
        gpos = gap_pos.get(q.number) if q.part == 6 else None
        gpos_sql = str(gpos) if gpos is not None else "NULL"
        shuffle_a = 1 if q.shuffle_a == "yes" else 0
        L.append(f"INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, "
                 f"StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES ("
                 f"{qid}, 1, {group_id if group_id is not None else 'NULL'}, {q.part}, {q.number}, "
                 f"{sq(q.stem)}, {gpos_sql}, '{q.answer}', {sq(q.hint)}, {shuffle_a}, {qid});")
    L.append("SET IDENTITY_INSERT dbo.Question OFF;")

    # 4. AnswerOptions
    L.append("SET IDENTITY_INSERT dbo.AnswerOption ON;")
    opt_id = 0
    for q in all_q:
        qid = q.number - 100
        for key in "ABCD":
            opt_id += 1
            L.append(f"INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) "
                     f"VALUES ({opt_id}, {qid}, '{key}', {sq(q.options.get(key, ''))}, {ord(key)-ord('A')});")
    L.append("SET IDENTITY_INSERT dbo.AnswerOption OFF;")

    L.append("COMMIT;")
    L.append("PRINT 'import ok';")

    with open(OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    print(f"Da sinh {OUT}")
    print(f"  groups={len(groups)}, questions={len(all_q)}, options={opt_id}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
