/*
  EMOTIOOON REPOSITORY
*/

import 'package:emotional_app/domain/models/emotion.dart';

abstract class EmotionRepo {
  // get list of Emotions
  Future<List<Emotion>> getEmotions();

  // add new Emotion
  Future<void> addEmotion(Emotion newEmotion);

  // delete an Emotion
  Future<void> deleteEmotion(Emotion emotion);
}