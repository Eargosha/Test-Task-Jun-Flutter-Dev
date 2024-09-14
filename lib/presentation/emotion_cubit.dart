/*
  EMOTION CUBIT - легкий менеджмент состояния, cubit вполне достаточно для 2-ух страниц

  Каждый такой cubit - есть список из Emotion
*/

import 'package:emotional_app/domain/models/emotion.dart';
import 'package:emotional_app/domain/repository/emotion_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmotionCubit extends Cubit<List<Emotion>> {
  // обьект на репозиторий
  final EmotionRepo emotionRepo;

  // Конструктор для иницциализации Cubit с пустым списком
  EmotionCubit(this.emotionRepo) : super([]) {
    loadEmotions();
  }

  /// Загрузка
  Future<void> loadEmotions() async {
    // Получаем список эмоций из репозитория
    final emotions = await emotionRepo.getEmotions();

    // Обновляем состояние Cubit
    emit(emotions);
  }

  /// Добавление
  Future<void> addEmotion(Emotion emotion) async {
    // Создание емоции с уникальным id
    final newEmotion = Emotion(
      id: DateTime.now().millisecondsSinceEpoch,
      issueDate: emotion.issueDate, 
      emotionType: emotion.emotionType,
      stressLevel: emotion.stressLevel,
      selfEsteemLevel: emotion.selfEsteemLevel,
    );

    // Сохранение новой эмоции в репозиторий
    await emotionRepo.addEmotion(newEmotion);

    // Перезагрузка состояния
    loadEmotions();
  }

  /// Удаление
  Future<void> deleteEmotion(Emotion emotion) async {
    // Удалить полученную эжмоцию
    await emotionRepo.deleteEmotion(emotion);

    // Презагрузиться
    loadEmotions();
  }
}
