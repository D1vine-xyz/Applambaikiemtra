# -*- coding: utf-8 -*-
import re
from docx import Document

doc = Document(r"C:/Giua-ky/TOEIC_Reading_Test7_Tagged.docx")
full = "\n".join(p.text for p in doc.paragraphs)

checks = [
    "[Q:", "[/Q:", "[ANSWER]", "[/ANSWER]", "[HINT]", "[OPTION:A]",
    "[OPTION:B]", "[OPTION:C]", "[OPTION:D]", "[SHUFFLE_Q]", "[SHUFFLE_A]",
    "[GROUP:", "[/GROUP:", "[PASSAGE]", "[/PASSAGE]", "[GAP:",
    "[PART:5]", "[PART:6]", "[PART:7]", "[QTEXT]",
]
for k in checks:
    print(f"{k:14} = {full.count(k)}")

ans = re.findall(r"\[ANSWER\]([A-D])\[/ANSWER\]", full)
print("answers:", len(ans), "all A-D:", all(a in "ABCD" for a in ans))

qids = re.findall(r"\[Q:(\d+)\]", full)
ids = [int(x) for x in qids]
print("q ids:", len(ids), "min", min(ids), "max", max(ids), "continuous:", ids == list(range(101, 201)))

hints = re.findall(r"\[HINT\](.+?)\[/HINT\]", full)
print("hints:", len(hints), "all non-empty:", all(h.strip() for h in hints))

# gia tri ANSWER phai trung voi dap an dung trong data
# (da kiem tra bang IDs OK=True luc sinh)
print("blank markers:", full.count("-------"))
