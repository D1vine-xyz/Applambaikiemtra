# -*- coding: utf-8 -*-
# Tao PDF co tag tu file docx da tag san (de test import PDF)
from docx import Document
from fpdf import FPDF

SRC = r"C:/Giua-ky/TOEIC_Reading_Test7_Tagged.docx"
OUT = r"C:/Giua-ky/TOEIC_Reading_Test7_Tagged.pdf"

doc = Document(SRC)
lines = [p.text for p in doc.paragraphs if p.text.strip()]

pdf = FPDF()
pdf.set_auto_page_break(auto=True, margin=12)
pdf.add_font("Arial", "", r"C:/Windows/Fonts/arial.ttf", uni=True)
pdf.add_page()
pdf.set_font("Arial", size=10)

for i, line in enumerate(lines):
    try:
        pdf.multi_cell(w=185, h=5, text=line)
    except Exception as e:
        print(f"LOI dong {i} (len={len(line)}): {line[:80]!r} -> {e}")
        pdf.multi_cell(w=185, h=5, text="[bo dong loi]")

pdf.output(OUT)
print("da ghi", len(lines), "dong vao", OUT)
