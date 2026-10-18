// Ung dung thi TOEIC Reading (frontend mobile - Flutter).
// Doi useMock = false va dat baseUrl tro den backend ASP.NET khi da co backend.
import 'package:flutter/material.dart';

import 'screens/exam_list_screen.dart';
import 'services/api_service.dart';

void main() {
  // ---- cau hinh ket noi ----
  // Chay kem backend:  flutter run -d chrome --dart-define=USE_MOCK=false
  // (Android emulator: them --dart-define=BASE_URL=http://10.0.2.2:5000)
  const bool useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true);
  const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'http://localhost:5000');

  final ApiService api = useMock ? MockApiService() : HttpApiService(baseUrl);

  runApp(ToeicApp(api: api));
}

class ToeicApp extends StatelessWidget {
  final ApiService api;
  const ToeicApp({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOEIC Reading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F4E79)),
        useMaterial3: true,
      ),
      home: ExamListScreen(api: api),
    );
  }
}
