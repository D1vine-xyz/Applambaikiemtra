# -*- coding: utf-8 -*-
"""Sinh ERD.svg (anh) + ERD.mmd (Mermaid) cho CSDL ToeicExam."""
import html

# (ten, [ (cot, kieu, 'PK'/'FK'/'') , ... ])
ENTITIES = [
    ("Exam", [
        ("Id", "INT", "PK"),
        ("Title", "NVARCHAR", ""),
        ("TimeLimitMinutes", "INT", ""),
        ("IsPublished", "BIT", ""),
        ("CreatedAt", "DATETIME2", ""),
    ]),
    ("QuestionGroup", [
        ("Id", "INT", "PK"),
        ("ExamId", "INT", "FK"),
        ("Part", "INT", ""),
        ("PassageText", "NVARCHAR(MAX)", ""),
        ("OrderIndex", "INT", ""),
        ("ShuffleQuestions", "BIT", ""),
    ]),
    ("Question", [
        ("Id", "INT", "PK"),
        ("ExamId", "INT", "FK"),
        ("GroupId", "INT", "FK"),
        ("Part", "INT", ""),
        ("QuestionNumber", "INT", ""),
        ("StemText", "NVARCHAR(MAX)", ""),
        ("GapPosition", "INT", ""),
        ("CorrectOptionKey", "CHAR(1)", ""),
        ("Hint", "NVARCHAR(MAX)", ""),
        ("ShuffleAnswers", "BIT", ""),
        ("OrderIndex", "INT", ""),
    ]),
    ("AnswerOption", [
        ("Id", "INT", "PK"),
        ("QuestionId", "INT", "FK"),
        ("OptionKey", "CHAR(1)", ""),
        ("OptionText", "NVARCHAR(MAX)", ""),
        ("OrderIndex", "INT", ""),
    ]),
    ("ExamAttempt", [
        ("Id", "INT", "PK"),
        ("ExamId", "INT", "FK"),
        ("StudentId", "NVARCHAR", ""),
        ("StartTime", "DATETIME2", ""),
        ("EndTime", "DATETIME2", ""),
        ("Score", "INT", ""),
    ]),
    ("StudentAnswer", [
        ("Id", "INT", "PK"),
        ("AttemptId", "INT", "FK"),
        ("QuestionId", "INT", "FK"),
        ("SelectedKey", "CHAR(1)", ""),
        ("AnsweredAt", "DATETIME2", ""),
    ]),
]

# vi tri (x, y) goc tren trai cua moi hop
POS = {
    "Exam": (420, 30),
    "QuestionGroup": (30, 350),
    "Question": (420, 350),
    "ExamAttempt": (810, 350),
    "AnswerOption": (30, 700),
    "StudentAnswer": (420, 700),
}
BOX_W = 270
HEAD_H = 34
ROW_H = 24

# quan he (parent, child) de ve mui ten 1:N
EDGES = [
    ("Exam", "QuestionGroup"),
    ("Exam", "Question"),
    ("Exam", "ExamAttempt"),
    ("QuestionGroup", "Question"),
    ("Question", "AnswerOption"),
    ("Question", "StudentAnswer"),
    ("ExamAttempt", "StudentAnswer"),
]

FONT = "Segoe UI, Arial, sans-serif"
HDR = "#1F4E79"       # xanh dam header
PKC = "#C00000"       # do PK
FKC = "#2E75B6"       # xanh FK


def box_height(n):
    return HEAD_H + n * ROW_H


def box_center(name):
    x, y = POS[name]
    h = box_height(len(dict((e[0], e) for e in ENTITIES)[name]))
    return (x + BOX_W / 2, y + h / 2)


def edge_anchor(name, side):
    """Tra ve diem neo o canh (top/bottom/left/right) cua hop."""
    x, y = POS[name]
    h = box_height(len(dict((e[0], e) for e in ENTITIES)[name]))
    if side == "top":
        return (x + BOX_W / 2, y)
    if side == "bottom":
        return (x + BOX_W / 2, y + h)
    if side == "left":
        return (x, y + h / 2)
    if side == "right":
        return (x + BOX_W, y + h / 2)


def main():
    # ---- SVG ----
    parts = []
    parts.append('<?xml version="1.0" encoding="UTF-8"?>')
    parts.append('<svg xmlns="http://www.w3.org/2000/svg" width="1120" height="860" '
                 'viewBox="0 0 1120 860" font-family="%s">' % FONT)
    parts.append('<rect width="1120" height="860" fill="white"/>')

    # ve cac canh truoc (duoi hop)
    for p, c in EDGES:
        # chon neo de duong thang gon
        if p == "Exam" and c in ("QuestionGroup", "Question", "ExamAttempt"):
            a = edge_anchor(p, "bottom"); b = edge_anchor(c, "top")
        elif p == "QuestionGroup" and c == "Question":
            a = edge_anchor(p, "right"); b = edge_anchor(c, "left")
        elif p == "Question" and c == "AnswerOption":
            a = edge_anchor(p, "left"); b = edge_anchor(c, "top")
        elif p == "ExamAttempt" and c == "StudentAnswer":
            a = edge_anchor(p, "bottom"); b = edge_anchor(c, "right")
        elif p == "Question" and c == "StudentAnswer":
            a = edge_anchor(p, "bottom"); b = edge_anchor(c, "top")
        else:
            a = edge_anchor(p, "bottom"); b = edge_anchor(c, "top")

        parts.append(f'<line x1="{a[0]:.0f}" y1="{a[1]:.0f}" x2="{b[0]:.0f}" '
                     f'y2="{b[1]:.0f}" stroke="#555" stroke-width="1.5" marker-end="url(#arrow)"/>')
        # nhan "1" gan parent, "N" gan child
        mx = (a[0] + b[0]) / 2; my = (a[1] + b[1]) / 2
        parts.append(f'<text x="{a[0]+8:.0f}" y="{a[1]-6:.0f}" font-size="13" fill="#000" font-weight="bold">1</text>')
        parts.append(f'<text x="{b[0]+8:.0f}" y="{b[1]+14:.0f}" font-size="13" fill="#000" font-weight="bold">N</text>')

    # ve cac hop
    for name, cols in ENTITIES:
        x, y = POS[name]
        h = box_height(len(cols))
        parts.append(f'<rect x="{x}" y="{y}" width="{BOX_W}" height="{h}" fill="#F5F8FC" '
                     f'stroke="#1F4E79" stroke-width="1.5"/>')
        parts.append(f'<rect x="{x}" y="{y}" width="{BOX_W}" height="{HEAD_H}" fill="{HDR}"/>')
        parts.append(f'<text x="{x+BOX_W/2}" y="{y+22}" font-size="15" fill="white" '
                     f'font-weight="bold" text-anchor="middle">{html.escape(name)}</text>')
        for i, (col, typ, mark) in enumerate(cols):
            ry = y + HEAD_H + i * ROW_H + 17
            mark_txt = ""
            color = "#111"
            if mark == "PK":
                mark_txt = "PK "; color = PKC
            elif mark == "FK":
                mark_txt = "FK "; color = FKC
            parts.append(f'<text x="{x+10}" y="{ry}" font-size="13" fill="{color}" '
                         f'font-weight="{"bold" if mark else "normal"}">{mark_txt}{html.escape(col)}</text>')
            parts.append(f'<text x="{x+BOX_W-10}" y="{ry}" font-size="11" fill="#666" '
                         f'text-anchor="end">{html.escape(typ)}</text>')
            if i < len(cols) - 1:
                parts.append(f'<line x1="{x}" y1="{y+HEAD_H+(i+1)*ROW_H}" x2="{x+BOX_W}" '
                             f'y2="{y+HEAD_H+(i+1)*ROW_H}" stroke="#DDD" stroke-width="0.8"/>')

    # dinh nghia mui ten
    parts.append('<defs><marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" '
                 'orient="auto"><path d="M0,0 L9,3 L0,6 z" fill="#555"/></marker></defs>')

    # chu giai
    parts.append('<text x="860" y="820" font-size="13" fill="#C00000" font-weight="bold">PK = Khóa chính</text>')
    parts.append('<text x="860" y="840" font-size="13" fill="#2E75B6" font-weight="bold">FK = Khóa ngoại</text>')

    parts.append('</svg>')
    svg = "\n".join(parts)
    with open(r"C:/Giua-ky/ERD.svg", "w", encoding="utf-8") as f:
        f.write(svg)

    # ---- Mermaid ----
    mm = ["erDiagram"]
    for name, cols in ENTITIES:
        attrs = []
        for col, typ, mark in cols:
            mk = "PK" if mark == "PK" else ("FK" if mark == "FK" else "")
            attrs.append(f"    {typ} {col} {mk}".strip())
        mm.append(f"  {name} {{")
        mm.extend(attrs)
        mm.append("  }")
    for p, c in EDGES:
        mm.append(f"  {p} ||--o{{ {c} : \"1:N\"")
    mermaid = "\n".join(mm)
    with open(r"C:/Giua-ky/ERD.mmd", "w", encoding="utf-8") as f:
        f.write(mermaid + "\n")

    print("SVG:", r"C:/Giua-ky/ERD.svg")
    print("Mermaid:", r"C:/Giua-ky/ERD.mmd")
    print("entities:", len(ENTITIES), "| edges:", len(EDGES))


if __name__ == "__main__":
    main()
