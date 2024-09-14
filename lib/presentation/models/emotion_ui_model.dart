import 'package:emotional_app/constants/app_constants.dart';

class EmotionUiModel {
  final String title;
  final Map<EmotionType, List<String>> emotionType;
  final String imagePath;

  const EmotionUiModel({
    required this.title,
    required this.imagePath,
    required this.emotionType,
  });
}
