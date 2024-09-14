/* 
  EMOTION MODEL 
*/

import 'package:emotional_app/constants/app_constants.dart';

class Emotion {
  final int id;
  final DateTime issueDate;
  // final EmotionType emotionType;
  // final List<SubFeelings> subFeelings;
  final Map<EmotionType, List<String>> emotionType;
  final double stressLevel;
  final double selfEsteemLevel;
  final String? note;


  Emotion( {
    required this.id,
    required this.issueDate,
    // required this.emotionType,
    // required this.subFeelings,
    required this.emotionType,
    required this.stressLevel, 
    required this.selfEsteemLevel,
    this.note,
  });

  @override
  String toString() {
    return 'Emotion(issueDate: $issueDate, emotionType: $emotionType, stressLevel: $stressLevel, selfEsteem: $selfEsteemLevel, note: $note )';
  }
}