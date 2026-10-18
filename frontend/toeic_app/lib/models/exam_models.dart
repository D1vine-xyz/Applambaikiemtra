// Mo hinh du lieu cua de thi (khớp API contract voi backend).
class ExamSummary {
  final int id;
  final String title;
  final int timeLimitMinutes;
  final int questionCount;
  ExamSummary({
    required this.id,
    required this.title,
    required this.timeLimitMinutes,
    required this.questionCount,
  });
  factory ExamSummary.fromJson(Map<String, dynamic> j) => ExamSummary(
        id: j['id'] as int,
        title: j['title'] as String,
        timeLimitMinutes: j['timeLimitMinutes'] as int,
        questionCount: j['questionCount'] as int,
      );
}

class Option {
  final String key; // A/B/C/D
  final String text;
  Option({required this.key, required this.text});
  factory Option.fromJson(Map<String, dynamic> j) =>
      Option(key: j['key'] as String, text: j['text'] as String);
}

class QuestionItem {
  final int id; // so thu tu cau (101..200)
  final int part;
  final String? stem; // Part 6: null (cho trong nam o passage)
  final List<Option> options;
  QuestionItem({
    required this.id,
    required this.part,
    required this.stem,
    required this.options,
  });
  factory QuestionItem.fromJson(Map<String, dynamic> j) => QuestionItem(
        id: j['id'] as int,
        part: j['part'] as int,
        stem: j['stem'] as String?,
        options: (j['options'] as List)
            .map((o) => Option.fromJson(o as Map<String, dynamic>))
            .toList(),
      );
}

class PassageItem {
  final int groupId;
  final int part;
  final String text;
  PassageItem({required this.groupId, required this.part, required this.text});
  factory PassageItem.fromJson(Map<String, dynamic> j) => PassageItem(
        groupId: j['groupId'] as int,
        part: j['part'] as int,
        text: j['text'] as String,
      );
}

/// Mot phan tu trong bang de thi: hoac la passage, hoac la cau hoi.
class ExamItem {
  final String type; // 'passage' | 'question'
  final PassageItem? passage;
  final QuestionItem? question;
  ExamItem.passage(PassageItem p)
      : type = 'passage',
        passage = p,
        question = null;
  ExamItem.question(QuestionItem q)
      : type = 'question',
        passage = null,
        question = q;
  factory ExamItem.fromJson(Map<String, dynamic> j) {
    final t = j['type'] as String;
    if (t == 'passage') {
      return ExamItem.passage(PassageItem.fromJson(j));
    }
    return ExamItem.question(QuestionItem.fromJson(j));
  }
}

class ExamContent {
  final int id;
  final String title;
  final int timeLimitMinutes;
  final List<ExamItem> items;
  ExamContent({
    required this.id,
    required this.title,
    required this.timeLimitMinutes,
    required this.items,
  });
  int get questionCount => items.where((i) => i.type == 'question').length;
  factory ExamContent.fromJson(Map<String, dynamic> j) => ExamContent(
        id: j['id'] as int,
        title: j['title'] as String,
        timeLimitMinutes: j['timeLimitMinutes'] as int,
        items: (j['items'] as List)
            .map((i) => ExamItem.fromJson(i as Map<String, dynamic>))
            .toList(),
      );
}

class AnswerSubmission {
  final int questionId;
  final String? key; // null = bo qua
  AnswerSubmission({required this.questionId, required this.key});
  Map<String, dynamic> toJson() => {'id': questionId, 'key': key};
}

class AnswerReview {
  final int id;
  final String? correctKey; // A/B/C/D
  final String? studentKey; // lua chon cua sinh vien (null = bo qua)
  AnswerReview({required this.id, required this.correctKey, required this.studentKey});
  factory AnswerReview.fromJson(Map<String, dynamic> j) => AnswerReview(
        id: j['id'] as int,
        correctKey: j['correctKey'] as String?,
        studentKey: j['studentKey'] as String?,
      );
}

class ExamResult {
  final int score;
  final int correct;
  final int wrong;
  final int skipped;
  final int total;
  final List<AnswerReview> review; // dap an dung + lua chon (khong co goi y)
  ExamResult({
    required this.score,
    required this.correct,
    required this.wrong,
    required this.skipped,
    required this.total,
    this.review = const [],
  });
  factory ExamResult.fromJson(Map<String, dynamic> j) => ExamResult(
        score: j['score'] as int,
        correct: j['correct'] as int,
        wrong: j['wrong'] as int,
        skipped: j['skipped'] as int,
        total: j['total'] as int,
        review: (j['review'] as List? ?? [])
            .map((r) => AnswerReview.fromJson(r as Map<String, dynamic>))
            .toList(),
      );
}
