// Man hinh ket qua: diem, thong ke, va dap an (KHONG kem giai thich chi tiet).
import 'package:flutter/material.dart';

import '../models/exam_models.dart';

class ResultScreen extends StatelessWidget {
  final ExamResult result;
  final String examTitle;
  final int timeUsedSeconds;
  final int timeLimitMinutes;
  const ResultScreen({
    super.key,
    required this.result,
    required this.examTitle,
    required this.timeUsedSeconds,
    required this.timeLimitMinutes,
  });

  String _fmtTimeUsed() {
    final m = timeUsedSeconds ~/ 60;
    final s = timeUsedSeconds % 60;
    return '$m phút $s giây';
  }

  String _fmtNow() {
    final n = DateTime.now();
    String p(int x) => x.toString().padLeft(2, '0');
    return '${p(n.hour)}:${p(n.minute)} • ${p(n.day)}/${p(n.month)}/${n.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kết quả bài thi')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                Text(examTitle,
                    style: const TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 4),
                Text('Thời gian nộp bài: ${_fmtNow()}',
                    style: const TextStyle(fontSize: 12.5, color: Colors.black45)),
                const SizedBox(height: 20),
                Text('${result.score}/${result.total}',
                    style: const TextStyle(fontSize: 54, fontWeight: FontWeight.w800)),
                Text('ĐIỂM SỐ / CÂU ĐÚNG',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600, letterSpacing: 1)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('✓ TRẠNG THÁI HOÀN THÀNH',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Chi tiết kết quả thống kê',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 12),
                  _stat('Số câu trả lời đúng', '${result.correct} câu', Colors.green),
                  _stat('Số câu trả lời sai', '${result.wrong} câu', Colors.red),
                  _stat('Số câu chưa làm / bỏ qua', '${result.skipped} câu', Colors.orange),
                  const Divider(height: 20),
                  _stat('Thời gian làm bài',
                      '${_fmtTimeUsed()} / $timeLimitMinutes phút', Colors.black87),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Đáp án các câu hỏi',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 8),
                  if (result.review.isEmpty)
                    const Text('Không có dữ liệu đáp án.',
                        style: TextStyle(color: Colors.black54)),
                  ...result.review.map((r) => _answerRow(r)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
            child: const Text('VỀ DANH SÁCH ĐỀ THI'),
          ),
        ],
      ),
    );
  }

  Widget _answerRow(AnswerReview r) {
    final student = r.studentKey;
    final correct = r.correctKey;
    final bool isSkip = student == null;
    final bool isRight = !isSkip && student == correct;
    final String studentText = isSkip ? 'bỏ qua' : student;
    Color color = Colors.black87;
    String mark = '';
    if (isSkip) {
      color = Colors.orange;
    } else if (isRight) {
      color = Colors.green;
      mark = '✓';
    } else {
      color = Colors.red;
      mark = '✗';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text('Câu ${r.id}: ',
              style: const TextStyle(fontSize: 13.5, color: Colors.black54)),
          Text(correct ?? '?',
              style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text('(bạn chọn: $studentText)',
              style: TextStyle(fontSize: 13, color: color)),
          if (mark.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(mark,
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }

  Widget _stat(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
