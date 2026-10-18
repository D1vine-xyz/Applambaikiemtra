# -*- coding: utf-8 -*-
"""
Parser + validator tham chieu cho file TOEIC_Reading_Test7_Tagged.docx.
Cai dat DU 7 quy tac validate (muc A.7 trong Tags_va_CSDL_ThietKe.md).

Dinh dang (khớp chính xác file docx đã sinh):
  - Tag don le, moi tag 1 dong: [PART:5] [Q:101] [/Q:101] [GROUP:131] [PASSAGE] [/PASSAGE] ...
  - Tag co noi dung ghi TREN CUNG 1 DONG: [QTEXT]...[/QTEXT], [OPTION:A]...[/OPTION:A],
    [ANSWER]A[/ANSWER], [HINT]...[/HINT], [SHUFFLE_Q]yes[/SHUFFLE_Q], ...
  - Noi dung passage nam giua [PASSAGE] va [/PASSAGE]; [GAP:n] nam trong passage.

Cach dung:
    python parse_and_validate.py <file.docx>
Thoat code 0 = hop le; 1 = co loi (in tung loi).
"""
import re
import sys
from docx import Document


class Question:
    def __init__(self, number):
        self.number = number
        self.part = None
        self.stem = None
        self.options = {}
        self.answer = None
        self.hint = None
        self.shuffle_q = None
        self.shuffle_a = None


class Group:
    def __init__(self, gid, part):
        self.id = gid
        self.part = part
        self.passage = ""
        self.gaps = []
        self.questions = []


class Exam:
    def __init__(self):
        self.title = None
        self.time = None
        self.part5 = []
        self.groups = []
        self.parts_seen = set()


def read_lines(path):
    doc = Document(path)
    return [p.text.strip() for p in doc.paragraphs if p.text.strip()]


def parse(lines):
    exam = Exam()
    errors = []
    cur_part = None
    cur_group = None
    cur_q = None
    in_passage = False

    re_q_open    = re.compile(r"^\[Q:(\d+)\]$")
    re_q_close   = re.compile(r"^\[/Q:(\d+)\]$")
    re_grp_open  = re.compile(r"^\[GROUP:(\d+)\]$")
    re_grp_close = re.compile(r"^\[/GROUP:(\d+)\]$")
    re_title = re.compile(r"^\[EXAM:TITLE\](.*)\[/EXAM:TITLE\]$")
    re_time  = re.compile(r"^\[EXAM:TIME\](\d+)\[/EXAM:TIME\]$")
    re_part  = re.compile(r"^\[PART:([567])\]$")
    re_qtext = re.compile(r"^\[QTEXT\](.*)\[/QTEXT\]$")
    re_opt   = re.compile(r"^\[OPTION:([A-D])\](.*)\[/OPTION:\1\]$")
    re_ans   = re.compile(r"^\[ANSWER\]([A-D])\[/ANSWER\]$")
    re_hint  = re.compile(r"^\[HINT\](.*)\[/HINT\]$")
    re_shq   = re.compile(r"^\[SHUFFLE_Q\](yes|no)\[/SHUFFLE_Q\]$")
    re_sha   = re.compile(r"^\[SHUFFLE_A\](yes|no)\[/SHUFFLE_A\]$")
    re_gap   = re.compile(r"\[GAP:(\d+)\]")

    for lineno, line in enumerate(lines, 1):
        def err(msg):
            errors.append(f"dong {lineno}: {msg}")

        m = re_title.match(line)
        if m:
            exam.title = m.group(1); continue
        m = re_time.match(line)
        if m:
            exam.time = int(m.group(1)); continue
        m = re_part.match(line)
        if m:
            cur_part = int(m.group(1))
            exam.parts_seen.add(cur_part)
            cur_group = None; cur_q = None; in_passage = False
            continue
        if line == "[PASSAGE]":
            if cur_group is None:
                err("[PASSAGE] nam ngoai [GROUP]")
            in_passage = True; continue
        if line == "[/PASSAGE]":
            in_passage = False; continue
        m = re_grp_open.match(line)
        if m:
            cur_group = Group(int(m.group(1)), cur_part); cur_q = None
            continue
        m = re_grp_close.match(line)
        if m:
            if cur_group is None:
                err("[/GROUP] khong co [GROUP] tuong ung")
            else:
                exam.groups.append(cur_group); cur_group = None
            continue
        m = re_q_open.match(line)
        if m:
            num = int(m.group(1))
            cur_q = Question(num); cur_q.part = cur_part
            if cur_part in (6, 7):
                if cur_group is None:
                    err(f"[Q:{num}] nam ngoai [GROUP]")
                else:
                    cur_group.questions.append(cur_q)
            elif cur_part == 5:
                exam.part5.append(cur_q)
            else:
                err(f"[Q:{num}] nam ngoai PART hop le")
            continue
        m = re_q_close.match(line)
        if m:
            cur_q = None; continue
        m = re_qtext.match(line)
        if m:
            if cur_q is None: err("[QTEXT] ngoai cau hoi")
            else: cur_q.stem = m.group(1)
            continue
        m = re_opt.match(line)
        if m:
            if cur_q is None: err(f"[OPTION:{m.group(1)}] ngoai cau hoi")
            else: cur_q.options[m.group(1)] = m.group(2)
            continue
        m = re_ans.match(line)
        if m:
            if cur_q is None: err("[ANSWER] ngoai cau hoi")
            else: cur_q.answer = m.group(1)
            continue
        m = re_hint.match(line)
        if m:
            if cur_q is None: err("[HINT] ngoai cau hoi")
            else: cur_q.hint = m.group(1)
            continue
        m = re_shq.match(line)
        if m:
            if cur_q is None: err("[SHUFFLE_Q] ngoai cau hoi")
            else: cur_q.shuffle_q = m.group(1)
            continue
        m = re_sha.match(line)
        if m:
            if cur_q is None: err("[SHUFFLE_A] ngoai cau hoi")
            else: cur_q.shuffle_a = m.group(1)
            continue
        if in_passage and cur_group is not None:
            cur_group.passage += line + "\n"
            for g in re_gap.findall(line):
                cur_group.gaps.append(int(g))
            continue
        err(f"dong khong nhan dien duoc: {line!r}")

    return exam, errors


def validate(exam):
    errors = []
    if not exam.title:
        errors.append("thieu [EXAM:TITLE]")
    if exam.time is None:
        errors.append("thieu [EXAM:TIME]")
    for p in (5, 6, 7):
        if p not in exam.parts_seen:
            errors.append(f"thieu [PART:{p}]")
    all_q = exam.part5[:]
    for g in exam.groups:
        all_q += g.questions
    ids = sorted(q.number for q in all_q)
    if ids != list(range(101, 201)):
        missing = sorted(set(range(101, 201)) - set(ids))
        dupes = sorted({x for x in ids if ids.count(x) > 1})
        errors.append(f"so cau/so thu tu sai: {len(ids)} cau, "
                      f"thieu={missing}, trung={dupes}")
    for q in all_q:
        for key in "ABCD":
            if key not in q.options or not q.options[key]:
                errors.append(f"cau {q.number}: thieu OPTION:{key}")
        if q.answer not in ("A", "B", "C", "D"):
            errors.append(f"cau {q.number}: ANSWER khong hop le ({q.answer!r})")
        if not q.hint:
            errors.append(f"cau {q.number}: thieu HINT")
        if q.shuffle_q not in ("yes", "no"):
            errors.append(f"cau {q.number}: thieu SHUFFLE_Q")
        if q.shuffle_a not in ("yes", "no"):
            errors.append(f"cau {q.number}: thieu SHUFFLE_A")
        if q.part == 7 and not q.stem:
            errors.append(f"cau {q.number} (Part 7): thieu QTEXT")
    for g in exam.groups:
        if g.part == 6:
            gq = sorted(q.number for q in g.questions)
            if sorted(g.gaps) != gq:
                errors.append(f"GROUP {g.id} (Part 6): GAP {sorted(g.gaps)} "
                              f"khong khop cau hoi {gq}")
    return errors


def main(path):
    exam, parse_errors = parse(read_lines(path))
    errors = parse_errors + validate(exam)

    if errors:
        print("KHONG HOP LE — file bi huy (khong luu vao CSDL):")
        for e in errors:
            print("  -", e)
        return 1

    total = len(exam.part5) + sum(len(g.questions) for g in exam.groups)
    p6 = sum(1 for g in exam.groups if g.part == 6)
    p7 = sum(1 for g in exam.groups if g.part == 7)
    print("HOP LE ✓ (pass ca 7 quy tac)")
    print(f"  Tieu de   : {exam.title}")
    print(f"  Thoi gian : {exam.time} phut")
    print(f"  Tong cau  : {total}  (Part5={len(exam.part5)} cau, "
          f"Part6={p6} nhom, Part7={p7} nhom)")
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Dung: python parse_and_validate.py <file.docx>")
        sys.exit(2)
    sys.exit(main(sys.argv[1]))
