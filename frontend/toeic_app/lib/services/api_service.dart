// Lop truy cap du lieu de thi.
// - MockApiService : du lieu mau (chay doc lap, khong can backend).
// - HttpApiService : goi backend ASP.NET (API contract ben duoi).
//
// API contract (backend phai tra dung):
//   GET  {base}/api/exams
//        -> [{"id":1,"title":"...","timeLimitMinutes":75,"questionCount":100}]
//   GET  {base}/api/exams/{id}
//        -> {"id":1,"title":"...","timeLimitMinutes":75,
//            "items":[ {"type":"passage","groupId":131,"part":6,"text":"...(131) ____..."},
//                      {"type":"question","id":101,"part":5,"stem":"...",
//                       "options":[{"key":"A","text":"..."},...]}, ... ]}
//   POST {base}/api/exams/{id}/submit
//        body: {"answers":[{"id":101,"key":"A"},{"id":102,"key":null},...]}
//        -> {"score":80,"correct":80,"wrong":15,"skipped":5,"total":100}
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/exam_models.dart';

abstract class ApiService {
  Future<List<ExamSummary>> fetchExams();
  Future<ExamContent> fetchExam(int examId);
  Future<ExamResult> submit(int examId, List<AnswerSubmission> answers);
}

// ---------------------------------------------------------------------------
// Mock (khong can backend). Chay duoc ngay de demo 3 man hinh.
// ---------------------------------------------------------------------------
class MockApiService implements ApiService {
  @override
  Future<List<ExamSummary>> fetchExams() async {
    return [
      ExamSummary(
          id: 1, title: 'TOEIC Reading Test 7', timeLimitMinutes: 75, questionCount: 6),
    ];
  }

  @override
  Future<ExamContent> fetchExam(int examId) async {
    return ExamContent(id: 1, title: 'TOEIC Reading Test 7', timeLimitMinutes: 75, items: [
      ExamItem.question(QuestionItem(id: 101, part: 5, stem: 'If ------- are not satisfied with an item, return it for a full refund within 30 days of purchase.', options: [
        Option(key: 'A', text: 'you'),
        Option(key: 'B', text: 'your'),
        Option(key: 'C', text: 'yours'),
        Option(key: 'D', text: 'yourself'),
      ])),
      ExamItem.question(QuestionItem(id: 102, part: 5, stem: 'The location of next month\'s online gaming forum is yet to be -------.', options: [
        Option(key: 'A', text: 'concluded'),
        Option(key: 'B', text: 'prevented'),
        Option(key: 'C', text: 'invited'),
        Option(key: 'D', text: 'decided'),
      ])),
      ExamItem.passage(PassageItem(groupId: 131, part: 6, text:
          'Dear PGD Account Holder,\n\nPGD Bank strives (131) ____ the highest levels of client security and service. Our three branch offices have proudly been a part of the community (132) ____ a combined total of 40 years.')),
      ExamItem.question(QuestionItem(id: 131, part: 6, stem: null, options: [
        Option(key: 'A', text: 'to provide'),
        Option(key: 'B', text: 'provided'),
        Option(key: 'C', text: 'providing'),
        Option(key: 'D', text: 'to be provided'),
      ])),
      ExamItem.question(QuestionItem(id: 132, part: 6, stem: null, options: [
        Option(key: 'A', text: 'except'),
        Option(key: 'B', text: 'amid'),
        Option(key: 'C', text: 'near'),
        Option(key: 'D', text: 'for'),
      ])),
      ExamItem.passage(PassageItem(groupId: 147, part: 7, text:
          'Sedwick Electronics Hiring Event\nMarch 2, 10 A.M.-5 P.M.\n22 Myer Street, Hanover, PA 17331\n\nSedwick Electronics is opening a new manufacturing facility in Hanover, Pennsylvania, and we need to fill many positions.')),
      ExamItem.question(QuestionItem(id: 147, part: 7, stem: 'For whom is the advertisement intended?', options: [
        Option(key: 'A', text: 'Recruiters'),
        Option(key: 'B', text: 'Job seekers'),
        Option(key: 'C', text: 'Local business owners'),
        Option(key: 'D', text: 'Current Sedwick Electronics employees'),
      ])),
      ExamItem.question(QuestionItem(id: 148, part: 7, stem: 'What is stated about Sedwick Electronics?', options: [
        Option(key: 'A', text: 'It is moving its headquarters.'),
        Option(key: 'B', text: 'It offers a training program for new employees.'),
        Option(key: 'C', text: 'It requires employees to wear uniforms.'),
        Option(key: 'D', text: 'It will have more than one location.'),
      ])),
    ]);
  }

  @override
  Future<ExamResult> submit(int examId, List<AnswerSubmission> answers) async {
    // Dap an mau cho mock (dung de tinh diem demo)
    const correct = {101: 'A', 102: 'D', 131: 'A', 132: 'D', 147: 'B', 148: 'D'};
    int c = 0, w = 0, s = 0;
    for (final a in answers) {
      if (a.key == null) {
        s++;
      } else if (correct[a.questionId] == a.key) {
        c++;
      } else {
        w++;
      }
    }
    return ExamResult(score: c, correct: c, wrong: w, skipped: s, total: answers.length);
  }
}

// ---------------------------------------------------------------------------
// HTTP (goi backend ASP.NET). Dung dart:io HttpClient (khong can goi them).
// ---------------------------------------------------------------------------
class HttpApiService implements ApiService {
  final String baseUrl;
  HttpApiService(this.baseUrl);

  Future<dynamic> _request(String method, String path, [Object? body]) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = {'Content-Type': 'application/json'};
    final http.Response res = method == 'GET'
        ? await http.get(uri, headers: headers)
        : await http.post(uri, headers: headers, body: jsonEncode(body ?? {}));
    if (res.statusCode != 200) {
      throw http.ClientException('HTTP ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body);
  }

  @override
  Future<List<ExamSummary>> fetchExams() async {
    final data = await _request('GET', '/api/exams') as List;
    return data
        .map((e) => ExamSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ExamContent> fetchExam(int examId) async {
    final data = await _request('GET', '/api/exams/$examId');
    return ExamContent.fromJson(data as Map<String, dynamic>);
  }

  @override
  Future<ExamResult> submit(int examId, List<AnswerSubmission> answers) async {
    final data = await _request('POST', '/api/exams/$examId/submit',
        {'answers': answers.map((a) => a.toJson()).toList()});
    return ExamResult.fromJson(data as Map<String, dynamic>);
  }
}
