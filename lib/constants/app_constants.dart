import '../presentation/models/emotion_ui_model.dart';

enum EmotionType {
  happy,
  fear,
  rabies,
  sad,
  calmness,
  strength,
}

enum SubFeelings {
  // Happy
  excitement,
  ecstasy,
  playfulness,
  enjoyment,
  charm,
  mindfulness,
  courage,
  pleasure,
  sensuality,
  energy,
  extravagance,

  // Fear
  terror,
  panic,
  apprehension,
  uneasiness,
  wariness,
  nervousness,

  // Rabies
  fury,
  rage,
  anger,
  irritation,
  annoyance,
  hostility,

  // Sad
  grief,
  sorrow,
  melancholy,
  loneliness,
  disappointment,
  despair,

  // Calmness
  serenity,
  peace,
  tranquility,
  contentment,
  relaxation,
  equanimity,

  // Strength
  confidence,
  determination,
  resilience,
  perseverance,
  assertiveness,
}

List<EmotionUiModel> emotionsForUI = [
  EmotionUiModel(
    title: 'Радость',
    imagePath: 'assets/images/emotion_happy.png',
    emotionType: {
      EmotionType.happy: emotionSubFeelingsMap[EmotionType.happy]!,
    },
  ),
  EmotionUiModel(
    title: 'Страх',
    imagePath: 'assets/images/emotion_fear.png',
    emotionType: {
      EmotionType.fear: emotionSubFeelingsMap[EmotionType.fear]!,
    },
  ),
  EmotionUiModel(
    title: 'Бешенство',
    imagePath: 'assets/images/emotion_rabies.png',
    emotionType: {
      EmotionType.rabies: emotionSubFeelingsMap[EmotionType.rabies]!,
    },
  ),
  EmotionUiModel(
    title: 'Грусть',
    imagePath: 'assets/images/emotion_sad.png',
    emotionType: {
      EmotionType.sad: emotionSubFeelingsMap[EmotionType.sad]!,
    },
  ),
  EmotionUiModel(
    title: 'Спокойствие',
    imagePath: 'assets/images/emotion_calm.png',
    emotionType: {
      EmotionType.calmness: emotionSubFeelingsMap[EmotionType.calmness]!,
    },
  ),
  EmotionUiModel(
    title: 'Сила',
    imagePath: 'assets/images/emotion_strength.png',
    emotionType: {
      EmotionType.strength: emotionSubFeelingsMap[EmotionType.strength]!,
    },
  ),
];

List<String> weekDays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
// Map<EmotionType, List<SubFeelings>> emotionSubFeelingsMap = {
//   EmotionType.happy: [
//     SubFeelings.excitement,
//     SubFeelings.ecstasy,
//     SubFeelings.playfulness,
//     SubFeelings.enjoyment,
//     SubFeelings.charm,
//     SubFeelings.mindfulness,
//     SubFeelings.courage,
//     SubFeelings.pleasure,
//     SubFeelings.sensuality,
//     SubFeelings.energy,
//     SubFeelings.extravagance,
//   ],
//   EmotionType.fear: [
//     SubFeelings.terror,
//     SubFeelings.panic,
//     SubFeelings.apprehension,
//     SubFeelings.uneasiness,
//     SubFeelings.wariness,
//     SubFeelings.nervousness,
//   ],
//   EmotionType.rabies: [
//     SubFeelings.fury,
//     SubFeelings.rage,
//     SubFeelings.anger,
//     SubFeelings.irritation,
//     SubFeelings.annoyance,
//     SubFeelings.hostility,
//   ],
//   EmotionType.sad: [
//     SubFeelings.grief,
//     SubFeelings.sorrow,
//     SubFeelings.melancholy,
//     SubFeelings.loneliness,
//     SubFeelings.disappointment,
//     SubFeelings.despair,
//   ],
//   EmotionType.calmness: [
//     SubFeelings.serenity,
//     SubFeelings.peace,
//     SubFeelings.tranquility,
//     SubFeelings.contentment,
//     SubFeelings.relaxation,
//     SubFeelings.equanimity,
//   ],
//   EmotionType.strength: [
//     SubFeelings.confidence,
//     SubFeelings.determination,
//     SubFeelings.resilience,
//     SubFeelings.perseverance,
//     SubFeelings.assertiveness,
//   ],
// };

Map<EmotionType, List<String>> emotionSubFeelingsMap = {
  EmotionType.happy: [
    'Возбуждение',
    'Восторг',
    'Игривость',
    'Наслаждение',
    'Очарование',
    'Осознанность',
    'Смелость',
    'Удовольствие',
    'Чувственность',
    'Энергичность',
    'Экстравагантность',
  ],
  EmotionType.fear: [
    'Ужас',
    'Паника',
    'Опасение',
    'Беспокойство',
    'Настороженность',
    'Нервозность',
  ],
  EmotionType.rabies: [
    'Ярость',
    'Бешенство',
    'Гнев',
    'Раздражение',
    'Досада',
    'Враждебность',
  ],
  EmotionType.sad: [
    'Горе',
    'Печаль',
    'Меланхолия',
    'Одиночество',
    'Разочарование',
    'Отчаяние',
  ],
  EmotionType.calmness: [
    'Спокойствие',
    'Мир',
    'Умиротворение',
    'Удовлетворенность',
    'Расслабленность',
    'Уравновешенность',
  ],
  EmotionType.strength: [
    'Уверенность',
    'Решимость',
    'Стойкость',
    'Настойчивость',
    'Напористость',
  ],
};
// extension SubFeelingExtension on EmotionType {
//   List<SubFeelings> get allowedSubFeelings {
//     switch (this) {
//       case EmotionType.happy:
//         return [
//           SubFeelings.excitement,
//           SubFeelings.ecstasy,
//           SubFeelings.playfulness,
//           SubFeelings.enjoyment,
//           SubFeelings.charm,
//           SubFeelings.mindfulness,
//           SubFeelings.courage,
//           SubFeelings.pleasure,
//           SubFeelings.sensuality,
//           SubFeelings.energy,
//           SubFeelings.extravagance,
//         ];
//       case EmotionType.fear:
//         return [
//           SubFeelings.terror,
//           SubFeelings.panic,
//           SubFeelings.apprehension,
//           SubFeelings.uneasiness,
//           SubFeelings.wariness,
//           SubFeelings.nervousness,
//         ];
//       case EmotionType.rabies:
//         return [
//           SubFeelings.fury,
//           SubFeelings.rage,
//           SubFeelings.anger,
//           SubFeelings.irritation,
//           SubFeelings.annoyance,
//           SubFeelings.hostility,
//         ];
//       case EmotionType.sad:
//         return [
//           SubFeelings.grief,
//           SubFeelings.sorrow,
//           SubFeelings.melancholy,
//           SubFeelings.loneliness,
//           SubFeelings.disappointment,
//           SubFeelings.despair,
//         ];
//       case EmotionType.calmness:
//         return [
//           SubFeelings.serenity,
//           SubFeelings.peace,
//           SubFeelings.tranquility,
//           SubFeelings.contentment,
//           SubFeelings.relaxation,
//           SubFeelings.equanimity,
//         ];
//       case EmotionType.strength:
//         return [
//           SubFeelings.confidence,
//           SubFeelings.determination,
//           SubFeelings.resilience,
//           SubFeelings.perseverance,
//           SubFeelings.assertiveness,
//         ];
//       default:
//         return [];
//     }
//   }

//   // Getters of SubFeelings For EmotionType.happy
//   SubFeelings get excitement => allowedSubFeelings[0];
//   SubFeelings get ecstasy => allowedSubFeelings[1];
//   SubFeelings get playfulness => allowedSubFeelings[2];
//   SubFeelings get enjoyment => allowedSubFeelings[3];
//   SubFeelings get charm => allowedSubFeelings[4];
//   SubFeelings get mindfulness => allowedSubFeelings[5];
//   SubFeelings get courage => allowedSubFeelings[6];
//   SubFeelings get pleasure => allowedSubFeelings[7];
//   SubFeelings get sensuality => allowedSubFeelings[8];
//   SubFeelings get energy => allowedSubFeelings[9];
//   SubFeelings get extravagance => allowedSubFeelings[10];

//   //Getters of SubFeelings For EmotionType.fear
//   SubFeelings get terror => allowedSubFeelings[0];
//   SubFeelings get panic => allowedSubFeelings[1];
//   SubFeelings get apprehension => allowedSubFeelings[2];
//   SubFeelings get uneasiness => allowedSubFeelings[3];
//   SubFeelings get wariness => allowedSubFeelings[4];
//   SubFeelings get nervousness => allowedSubFeelings[5];

//   //Getters of SubFeelings For EmotionType.rabies
//   SubFeelings get fury => allowedSubFeelings[0];
//   SubFeelings get rage => allowedSubFeelings[1];
//   SubFeelings get anger => allowedSubFeelings[2];
//   SubFeelings get irritation => allowedSubFeelings[3];
//   SubFeelings get annoyance => allowedSubFeelings[4];
//   SubFeelings get hostility => allowedSubFeelings[5];

//   //Getters of SubFeelings For EmotionType.sad
//   SubFeelings get grief => allowedSubFeelings[0];
//   SubFeelings get sorrow => allowedSubFeelings[1];
//   SubFeelings get melancholy => allowedSubFeelings[2];
//   SubFeelings get loneliness => allowedSubFeelings[3];
//   SubFeelings get disappointment => allowedSubFeelings[4];
//   SubFeelings get despair => allowedSubFeelings[5];

//   //Getters of SubFeelings For EmotionType.calmness
//   SubFeelings get serenity => allowedSubFeelings[0];
//   SubFeelings get peace => allowedSubFeelings[1];
//   SubFeelings get tranquility => allowedSubFeelings[2];
//   SubFeelings get contentment => allowedSubFeelings[3];
//   SubFeelings get relaxation => allowedSubFeelings[4];
//   SubFeelings get equanimity => allowedSubFeelings[5];

//   //Getters of SubFeelings For EmotionType.strength
//   SubFeelings get confidence => allowedSubFeelings[0];
//   SubFeelings get determination => allowedSubFeelings[1];
//   SubFeelings get resilience => allowedSubFeelings[2];
//   SubFeelings get perseverance => allowedSubFeelings[4];
//   SubFeelings get assertiveness => allowedSubFeelings[5];
// }
