// Man hinh danh sach de thi (giong layout Figma: thong bao, the de, luu y, tab duoi).
import 'package:flutter/material.dart';

import '../models/exam_models.dart';
import '../services/api_service.dart';
import 'exam_screen.dart';

class ExamListScreen extends StatefulWidget {
  final ApiService api;
  const ExamListScreen({super.key, required this.api});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  late Future<List<ExamSummary>> _future;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _future = widget.api.fetchExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOEIC Reading', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.person, size: 18),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ExamSummary>>(
        future: _future,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Lỗi tải đề: ${snap.error}'));
          }
          final exams = snap.data ?? [];
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              _noticeBanner(context),
              const SizedBox(height: 16),
              Text('Danh sách đề thi đang mở (${exams.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...exams.map((e) => _examCard(context, e)),
              const SizedBox(height: 16),
              _rulesCard(context),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Đề thi'),
          NavigationDestination(icon: Icon(Icons.history), label: 'Lịch sử'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }

  Widget _noticeBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)),
      ),
      child: const Row(
        children: [
          Text('📢', style: TextStyle(fontSize: 22)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Thông báo kỳ thi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 2),
                Text('Kỳ thi TOEIC Reading đang mở. Làm bài trong 75 phút, nộp trước khi hết giờ.',
                    style: TextStyle(fontSize: 12.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _examCard(BuildContext context, ExamSummary e) {
    final code = 'TEST-${e.id.toString().padLeft(2, '0')}';
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(e.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('ĐANG MỞ',
                      style: TextStyle(
                          color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text('Mã đề: $code  •  Part 5 • Part 6 • Part 7',
                style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.schedule, size: 16, color: Colors.black54),
                const SizedBox(width: 4),
                Text('${e.timeLimitMinutes} phút',
                    style: const TextStyle(fontSize: 13, color: Colors.black54)),
                const SizedBox(width: 16),
                const Icon(Icons.description_outlined, size: 16, color: Colors.black54),
                const SizedBox(width: 4),
                Text('${e.questionCount} câu hỏi',
                    style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExamScreen(
                          api: widget.api, examId: e.id, examTitle: e.title),
                    ),
                  );
                },
                child: const Text('BẮT ĐẦU LÀM BÀI →'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rulesCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lưu ý & Quy định phòng thi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 6),
          Text('• Làm bài đúng 75 phút, hệ thống tự nộp khi hết giờ.\n• Có thể đổi/hủy đáp án trước khi nộp.\n• Chỉ nộp 1 lần duy nhất.',
              style: TextStyle(fontSize: 12.5, height: 1.5)),
        ],
      ),
    );
  }
}
