# -*- coding: utf-8 -*-
"""Test end-to-end API backend (exam 2) qua HTTP + SQL Server."""
import json
import subprocess
import urllib.request

BASE = "http://localhost:5000"


def get(path):
    with urllib.request.urlopen(BASE + path) as r:
        return json.loads(r.read().decode("utf-8"))


def post(path, body):
    data = json.dumps(body).encode("utf-8")
    req = urllib.request.Request(BASE + path, data=data, method="POST",
                                 headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read().decode("utf-8"))


def sql(query):
    out = subprocess.run(
        ["sqlcmd", "-S", "localhost", "-E", "-C", "-d", "ToeicExam",
         "-W", "-s", "|", "-h", "-1", "-Q", "SET NOCOUNT ON; " + query],
        capture_output=True, text=True)
    return out.stdout.strip()


# 1. noi dung de
c = get("/api/exams/2")
items = c["items"]
qs = [i for i in items if i["type"] == "question"]
pas = [i for i in items if i["type"] == "passage"]
ids = [i["id"] for i in qs]
print("title:", c["title"], "| time:", c["timeLimitMinutes"])
print("questions:", len(qs), "| passages:", len(pas))
print("ids continuous 101..200:", ids == list(range(101, 201)))
print("all questions have 4 options A-D:",
      all([o["key"] for o in q["options"]] == ["A", "B", "C", "D"] for q in qs))
print("part6 questions have null stem:",
      all(q["stem"] is None for q in qs if q["part"] == 6))

# 2. lay dap an dung tu DB (exam 2)
rows = sql("SELECT QuestionNumber, CorrectOptionKey FROM dbo.Question WHERE ExamId=2 ORDER BY QuestionNumber")
correct = {}
for line in rows.splitlines():
    num, key = line.split("|")
    correct[int(num)] = key.strip()
print("correct keys loaded:", len(correct))

# 3. nop bai dung 100/100
full = [{"id": n, "key": correct[n]} for n in sorted(correct)]
r = get_result = post("/api/exams/2/submit", {"answers": full})
print("submit all-correct ->", r)

# 4. nop bai lan 2: 10 dung, 5 sai, con lai bo qua
ids_sorted = sorted(correct)
partial = []
for i, n in enumerate(ids_sorted):
    if i < 10:
        partial.append({"id": n, "key": correct[n]})       # dung
    elif i < 15:
        wrong = "A" if correct[n] != "A" else "B"          # sai
        partial.append({"id": n, "key": wrong})
    else:
        partial.append({"id": n, "key": None})              # bo qua
r2 = post("/api/exams/2/submit", {"answers": partial})
print("submit partial (10 dung,5 sai,85 bo qua) ->", r2)
assert r["score"] == 100 and r["correct"] == 100 and r["wrong"] == 0 and r["skipped"] == 0
assert r2["correct"] == 10 and r2["wrong"] == 5 and r2["skipped"] == 85 and r2["total"] == 100
print("ALL ASSERTIONS PASSED ✓")
