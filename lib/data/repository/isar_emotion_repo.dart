/*
  DATABASE REPO

  Имлементация методов из EmotionRepo
*/

import 'package:emotional_app/data/models/isar_emotion.dart';
import 'package:emotional_app/domain/models/emotion.dart';
import 'package:emotional_app/domain/repository/emotion_repo.dart';
import 'package:isar/isar.dart';

class IsarEmotionRepo implements EmotionRepo {
  // База данных
  final Isar db;

  IsarEmotionRepo(this.db);

  /// Метод добавления эмоции в БД
  @override
  Future<void> addEmotion(Emotion newEmotion) async {
    // конвертируем обычный в isar обьект
    final emotionIsar = EmotionIsar.fromDomain(newEmotion);

    // и затем складируем его в бд
    return db.writeTxn(() => db.emotionIsars.put(emotionIsar));
  }

  /// Метод удаления эмоции из БД
  @override
  Future<void> deleteEmotion(Emotion emotion) async {
    await db.writeTxn(() => db.emotionIsars.delete(emotion.id));
  }

  /// Метод получения списка эмоций
  @override
  Future<List<Emotion>> getEmotions() async {
    // получение из бд
    final emotions = await db.emotionIsars.where().findAll();

    // возращаем
    return emotions.map((emotionIsar) => emotionIsar.toDomain()).toList();
  }
  
}