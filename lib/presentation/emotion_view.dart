/*
  EMOTION VIEW: Есть интерфейс

  Используется BlocBuilder
*/

import 'package:emotional_app/constants/app_constants.dart';
import 'package:emotional_app/constants/color_constants.dart';
import 'package:emotional_app/constants/path_constants.dart';
import 'package:emotional_app/domain/models/emotion.dart';
import 'package:emotional_app/presentation/calendar_page.dart';
import 'package:emotional_app/presentation/emotion_cubit.dart';
import 'package:emotional_app/presentation/models/emotion_ui_model.dart';
import 'package:emotional_app/widgets/emotion_slider.dart';
import 'package:emotional_app/widgets/emotion_tab.dart';
import 'package:emotional_app/widgets/emotion_type_selector.dart';
import 'package:emotional_app/widgets/emotional_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionView extends StatefulWidget {
  EmotionView({super.key});

  @override
  State<EmotionView> createState() => _EmotionViewState();
}

class _EmotionViewState extends State<EmotionView> {
  bool _switchValue = true;
  bool _isFormCompleted = false;
  bool _isStressSliderChanged = false;
  bool _isSelfEsteemSliderChanged = false;

  double _stressSliderValue = 50;
  double _selfEsteemSliderValue = 50;
  List<EmotionUiModel> _listOfEmotions = [];
  List<String> _listOfSubEmotions = [];
  String _emotionalNote = '';
  DateTime today = DateTime.now();

  void _showThatEmotionAdded(BuildContext context) {
    _addEmotionToDB();

    print(_listOfSubEmotions);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          child: const Text('Ваша эмоция дня добавлена!'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Хорошо!'),
          ),
        ],
      ),
    );
  }

  List<SubFeelings> _stringToSubFeelings(List<String> values) {
    return values.map((value) {
      return SubFeelings.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => throw ArgumentError('Invalid SubFeelings value: $value'),
      );
    }).toList();
  }

  void _addEmotionToDB() {
    final emotionCubit = context.read<EmotionCubit>();

    _listOfEmotions.forEach((el) {
      Emotion em = Emotion(
        id: DateTime.now().millisecondsSinceEpoch,
        issueDate: today,
        emotionType: el.emotionType,
        stressLevel: _stressSliderValue,
        selfEsteemLevel: _selfEsteemSliderValue,
        note: _emotionalNote,
      );
      emotionCubit.addEmotion(em);
    });
  }

  void _checkFormReadyToAdd() {
    setState(() {
      _isFormCompleted = _emotionalNote.isNotEmpty &&
          _isStressSliderChanged &&
          _isSelfEsteemSliderChanged &&
          _listOfEmotions.isNotEmpty;
    });
  }

  String getTodayString(DateTime day) {
    String monthNames =
        'Января Февраля Марта Апреля Мая Июня Июля Августа Сентября Октября Ноября Декабря';
    return '${day.day} ${monthNames.split(' ')[day.month - 1]} ${day.hour}:${day.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      appBar: AppBar(
        backgroundColor: AppColors.BACKGROUND,
        title: Text(
          getTodayString(today),
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            color: const Color.fromRGBO(188, 188, 191, 1),
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: IconButton(
              iconSize: 24,
              icon: SvgPicture.asset(
                PathConstants.CALENDAR_ICON,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                //Можно было бы использовать go router 
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CalendarPage(
                      onSelected: (p0) {
                        setState(() {
                          today = p0;
                          print(today);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: BlocBuilder<EmotionCubit, List<Emotion>>(
        builder: (context, emotions) {
          return SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  EmotionTab(
                    initialValue: _switchValue,
                    onChanged: (p0) {
                      setState(() {
                        _switchValue = p0;
                      });
                    },
                    firstSVG: PathConstants.DIARY_ICON,
                    secondSVG: PathConstants.STATISTICK_ICON,
                    firstText: 'Двевник настроения',
                    secondText: 'Статистика',
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  _switchValue
                      ? _buildDiaryPage(context, emotions)
                      : _buildStatisticsPage(context, emotions),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _switchValue
          ? Padding(
              padding: const EdgeInsets.only(bottom: 46.0),
              child: GestureDetector(
                onTap: () {
                  _showThatEmotionAdded(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 335,
                      height: 44,
                      decoration: BoxDecoration(
                        color: !_isFormCompleted
                            ? const Color.fromRGBO(242, 242, 242, 1)
                            : const Color.fromRGBO(255, 135, 2, 1),
                        borderRadius: BorderRadius.circular(69),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Сохранить',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            color: !_isFormCompleted
                                ? const Color.fromRGBO(188, 188, 191, 1)
                                : Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildStatisticsPage(BuildContext context, List<Emotion> emotions) {
    // Здесь будет ваш код для страницы статистики
    return Center(
      child: SizedBox(
        width: 335,
        height: MediaQuery.of(context).size.height * 0.6,
        child: ListView.builder(
          itemCount: emotions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Emotion #${emotions[index].id}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${emotions[index].issueDate.toString()}'),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: emotions[index].emotionType.entries.map((entry) {
                      final emotionType = entry.key;
                      final subFeelings = entry.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                            backgroundColor: Colors.grey,
                            label: Text(emotionType.name),
                          ),
                          const SizedBox(height: 8),
                          Text('Подчувства: $subFeelings'),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'Stress level: ${emotions[index].stressLevel.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  Text(
                      'Self-esteem level: ${emotions[index].selfEsteemLevel.toStringAsFixed(2)}'),
                  if (emotions[index].note != null) ...[
                    const SizedBox(height: 8),
                    Text('Note: ${emotions[index].note}')
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDiaryPage(BuildContext context, List<Emotion> emotions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmotionTypeSelector(
          onSelectedEmotions: (List<EmotionUiModel> value) {
            _listOfEmotions = value;
            _checkFormReadyToAdd(); // Проверка после изменения
            if (_listOfEmotions.isEmpty) {
              _listOfSubEmotions = [];
            }
          },
          onSelectedSubEmotions: (List<String> value) {
            _listOfSubEmotions = value;
            _checkFormReadyToAdd(); // Проверка после изменения
          },
          emotions: emotionsForUI,
        ),
        const SizedBox(
          height: 26,
        ),
        EmotionSlider(
          // isChaned: _isStressSliderChanged,
          sliderValue: _stressSliderValue,
          sliderHeader: 'Уровень стресса',
          rightText: 'Высокий',
          leftText: 'Низкий',
          onChanged: (value) {
            _stressSliderValue = value;
            _isStressSliderChanged = true; // Отмечаем, что слайдер был изменен
            _checkFormReadyToAdd(); // Проверка после изменения
          },
        ),
        const SizedBox(
          height: 36,
        ),
        EmotionSlider(
          // isChaned: _isSelfEsteemSliderChanged,
          sliderValue: _selfEsteemSliderValue,
          sliderHeader: 'Самооценка',
          rightText: 'Уверенность',
          leftText: 'Неуверенность',
          onChanged: (value) {
            _selfEsteemSliderValue = value;
            _isSelfEsteemSliderChanged =
                true; // Отмечаем, что слайдер был изменен
            _checkFormReadyToAdd(); // Проверка после изменения
          },
        ),
        const SizedBox(
          height: 36,
        ),
        EmotionalNotes(
          onSubmitted: (p0) {
            _emotionalNote = p0;
            _checkFormReadyToAdd(); // Проверка после изменения
          },
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
