/*
  ISAR EMOTION

  Convert Emotion model into Isar Emotion model that can be stored in Isar DB
*/

import 'package:emotional_app/constants/app_constants.dart';
import 'package:emotional_app/domain/models/emotion.dart';
import 'package:isar/isar.dart';

// Для генерации isar emotion object
part 'isar_emotion.g.dart';

// Функция преобразования List<String> в List<SubFeelings>
List<SubFeelings> _stringToSubFeelings(List<String> values) {
  return values.map((value) {
    return SubFeelings.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => throw ArgumentError('Invalid SubFeelings value: $value'),
    );
  }).toList();
}

// Функция преобразования List<SubFeelings> в List<String>
List<String> _subFeelingToStringList(List<SubFeelings> subFeelings) {
  return subFeelings.map((e) => e.toString().split('.').last).toList();
}

@collection
class EmotionIsar {
  Id id = Isar.autoIncrement;
  late DateTime issueDate;
  late String emotionType;
  late List<String> subFeelings;
  late double stressLevel;
  late double selfEsteemLevel;
  late String? note;

  // convert isar to pure emotion object
  Emotion toDomain() {
    return Emotion(
      id: id,
      issueDate: issueDate,
      emotionType: {
        EmotionType.values.firstWhere((type) =>
            type.toString() ==
            emotionType.replaceAll('(', '').replaceAll(')', '')): subFeelings,
      }, //
      stressLevel: stressLevel,
      selfEsteemLevel: selfEsteemLevel,
      note: note,
    );
  }

  // convert pure emotion object to isar
  static EmotionIsar fromDomain(Emotion emotion) {
    return EmotionIsar()
      ..id = emotion.id
      ..issueDate = emotion.issueDate
      ..emotionType = emotion.emotionType.keys.toString()
      ..subFeelings = emotion.emotionType.values.expand((list) => list).toList()
      ..stressLevel = emotion.stressLevel
      ..selfEsteemLevel = emotion.selfEsteemLevel
      ..note = emotion.note;
  }
}

void main(List<String> args) {
  Emotion e = Emotion(
      id: 123,
      issueDate: DateTime.now(),
      emotionType: {
        EmotionType.fear: ['Ужас', 'Паника']
      },
      stressLevel: 132,
      selfEsteemLevel: 23);
  print(e.toString());

  EmotionIsar eI = EmotionIsar.fromDomain(e);
  print(eI);

  Emotion b = eI.toDomain();
  print(b);
}
