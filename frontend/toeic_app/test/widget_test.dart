// Kiem thu: mock service tra du lieu dung, va man hinh danh sach render duoc.
import 'package:flutter_test/flutter_test.dart';

import 'package:toeic_app/main.dart';
import 'package:toeic_app/models/exam_models.dart';
import 'package:toeic_app/services/api_service.dart';

void main() {
  test('Mock fetchExams tra 1 de thi', () async {
    final api = MockApiService();
    final exams = await api.fetchExams();
    expect(exams.length, 1);
    expect(exams.first.title, 'TOEIC Reading Test 7');
    expect(exams.first.timeLimitMinutes, 75);
  });

  test('Mock fetchExam tra 6 cau + 2 bai doc', () async {
    final api = MockApiService();
    final content = await api.fetchExam(1);
    expect(content.questionCount, 6);
    final passages = content.items.where((i) => i.type == 'passage').length;
    expect(passages, 2);
  });

  test('Mock submit cham diem dung (dung/sai/bo qua)', () async {
    final api = MockApiService();
    final result = await api.submit(1, [
      AnswerSubmission(questionId: 101, key: 'A'), // dung
      AnswerSubmission(questionId: 102, key: 'A'), // sai (dap an dung D)
      AnswerSubmission(questionId: 131, key: null), // bo qua
    ]);
    expect(result.correct, 1);
    expect(result.wrong, 1);
    expect(result.skipped, 1);
    expect(result.score, 1);
  });

  testWidgets('Man hinh danh sach hien thi de thi', (tester) async {
    await tester.pumpWidget(ToeicApp(api: MockApiService()));
    // cho FutureBuilder hoan thanh
    await tester.pumpAndSettle();
    expect(find.text('TOEIC Reading'), findsOneWidget);
    expect(find.text('TOEIC Reading Test 7'), findsOneWidget);
    expect(find.textContaining('75 phút'), findsWidgets);
  });
}
