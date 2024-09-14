import 'package:emotional_app/data/models/isar_emotion.dart';
import 'package:emotional_app/data/repository/isar_emotion_repo.dart';
import 'package:emotional_app/domain/repository/emotion_repo.dart';
import 'package:emotional_app/presentation/emotion_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  // Инициализируем локализацию ru_RU
  initializeDateFormatting('ru_RU', null);

  WidgetsFlutterBinding.ensureInitialized();

  // Получаем путь, где хранится БД
  final dir = await getApplicationDocumentsDirectory();

  // "Открываем" БД Isar
  final isar = await Isar.open([EmotionIsarSchema], directory: dir.path);

  // Инициализируем репозиторий с БД
  final isarEmotionRepo = IsarEmotionRepo(isar);

  runApp(MainApp(
    emotionRepo: isarEmotionRepo,
  ));
}

class MainApp extends StatelessWidget {
  // База данных
  final EmotionRepo emotionRepo;

  const MainApp({
    super.key,
    required this.emotionRepo,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmotionPage(
        emotionRepo: emotionRepo,
      ),
    );
  }
}
