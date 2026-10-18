// Man hinh lam bai thi (giong layout Figma): 1 cau/luot, tien do, phan thi,
// chuyen cau truoc/sau, danh sach cau, dem nguoc, tu thu bai, khoa khi het gio.
import 'dart:async';

import 'package:flutter/material.dart';

import '../models/exam_models.dart';
import '../services/api_service.dart';
import 'result_screen.dart';

class _Entry {
  final QuestionItem question;
  final String? passageText;
  _Entry(this.question, this.passageText);
}

class ExamScreen extends StatefulWidget {
  final ApiService api;
  final int examId;
  final String examTitle;
  const ExamScreen({
    super.key,
    required this.api,
    required this.examId,
    required this.examTitle,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  ExamContent? _content;
  String? _error;
  final Map<int, String?> _answers = {};
  final List<_Entry> _entries = [];
  int _currentIndex = 0;
  int _remaining = 0;
  int _timeLimit = 75;
  Timer? _timer;
  bool _submitting = false;
  bool _locked = false;

  int get _total => _entries.length;
  int get _answered => _answers.values.where((v) => v != null).length;
  int get _unanswered => _total - _answered;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final c = await widget.api.fetchExam(widget.examId);
      setState(() {
        _content = c;
        _timeLimit = c.timeLimitMinutes;
        _remaining = c.timeLimitMinutes * 60;
        _buildEntries(c);
        _startTimer();
      });
    } catch (e) {
      setState(() => _error = 'Không tải được đề: $e');
    }
  }

  void _buildEntries(ExamContent c) {
    String? passage;
    for (final item in c.items) {
      if (item.type == 'passage') {
        passage = item.passage!.text;
      } else {
        _entries.add(_Entry(item.question!, passage));
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining <= 1) {
        _timer?.cancel();
        setState(() {
          _remaining = 0;
          _locked = true; // khoa chon dap an khi het gio
        });
        _submit(auto: true);
      } else {
        setState(() => _remaining--);
      }
    });
  }

  String _fmt(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }

  void _select(String key) {
    if (_locked || _submitting) return;
    final q = _entries[_currentIndex].question;
    setState(() {
      _answers[q.id] = _answers[q.id] == key ? null : key;
    });
  }

  Future<void> _submit({bool auto = false}) async {
    if (_submitting) return;
    setState(() => _submitting = true);
    _timer?.cancel();

    final answers = _entries
        .map((e) => AnswerSubmission(
            questionId: e.question.id, key: _answers[e.question.id]))
        .toList();

    final timeUsed = _timeLimit * 60 - _remaining;
    try {
      final result = await widget.api.submit(widget.examId, answers);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
              result: result,
              examTitle: widget.examTitle,
              timeUsedSeconds: timeUsed,
              timeLimitMinutes: _timeLimit),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Nộp bài lỗi: $e')));
    }
  }

  Future<void> _confirmSubmit() async {
    final msg = _unanswered == 0
        ? 'Bạn đã hoàn thành tất cả câu hỏi. Nộp bài?'
        : 'Bạn còn $_unanswered câu chưa làm. Nộp bài?';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận nộp bài'),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Làm tiếp')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Nộp bài')),
        ],
      ),
    );
    if (ok == true) _submit();
  }

  void _showQuestionGrid() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Danh sách câu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8, mainAxisSpacing: 8, crossAxisSpacing: 8),
                  itemCount: _total,
                  itemBuilder: (ctx, i) {
                    final q = _entries[i].question;
                    final answered = _answers[q.id] != null;
                    final isCurrent = i == _currentIndex;
                    return InkWell(
                      onTap: () {
                        setState(() => _currentIndex = i);
                        Navigator.pop(ctx);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: answered
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade200,
                          border: isCurrent
                              ? Border.all(color: Colors.orange, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('${q.id}',
                            style: TextStyle(
                              color: answered ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(appBar: AppBar(), body: Center(child: Text(_error!)));
    }
    if (_content == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final warn = _remaining <= 300;
    final entry = _entries[_currentIndex];
    final q = entry.question;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (!_locked && !_submitting) Navigator.pop(context);
          },
        ),
        title: Text(widget.examTitle, style: const TextStyle(fontSize: 15)),
        actions: [
          Center(
            child: Text(
              _fmt(_remaining),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: warn ? Colors.red : Colors.black87,
              ),
            ),
          ),
          TextButton(
            onPressed: _submitting ? null : _confirmSubmit,
            child: const Text('Nộp bài'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: warn ? Colors.red.shade50 : Colors.blue.shade50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tiến độ: $_answered/$_total câu',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text('Phần thi: Part ${q.part}',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                if (warn)
                  const Text('⏳ Sắp hết giờ!',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (entry.passageText != null)
                    _passageCard(entry.passageText!, q.part),
                  _questionCard(q),
                ],
              ),
            ),
          ),
          // Dieu huong cau
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _currentIndex > 0
                          ? () => setState(() => _currentIndex--)
                          : null,
                      child: const Text('← Câu trước'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _showQuestionGrid,
                      child: const Text('Danh sách câu'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _currentIndex < _total - 1
                          ? () => setState(() => _currentIndex++)
                          : null,
                      child: const Text('Câu sau →'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passageCard(String text, int part) {
    return Card(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BÀI ĐỌC - PART $part',
                style: const TextStyle(
                    fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(text, style: const TextStyle(height: 1.5, fontSize: 13.5)),
          ],
        ),
      ),
    );
  }

  Widget _questionCard(QuestionItem q) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('${q.id}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    q.stem ?? 'Chọn từ/cụm từ điền vào chỗ trống (${q.id})',
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...q.options.map((o) {
              final isSel = _answers[q.id] == o.key;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _select(o.key),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSel
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                        width: isSel ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: isSel
                          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
                          : null,
                    ),
                    child: Row(
                      children: [
                        Text('${o.key}. ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSel
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.black54)),
                        Expanded(
                            child: Text(o.text, style: const TextStyle(height: 1.3))),
                        if (isSel)
                          Icon(Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
