import 'package:emotional_app/presentation/models/emotion_ui_model.dart';
import 'package:emotional_app/widgets/components/sub_emotion_tile.dart';
import 'package:flutter/material.dart';

class EmotionDetails extends StatefulWidget {
  final ValueChanged<List<String>> onSelected;
  final EmotionUiModel emotion;

  const EmotionDetails({
    super.key,
    required this.emotion, required this.onSelected,
  });

  @override
  State<EmotionDetails> createState() => _EmotionDetailsState();
}

class _EmotionDetailsState extends State<EmotionDetails> {
  List<String> _selectedEmotions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final emotionType in widget.emotion.emotionType.keys)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.emotion.emotionType[emotionType]!
                      .map(
                        (subFeeling) => SubEmotionTile(
                          isSelected: _selectedEmotions.contains(subFeeling),
                          title: subFeeling,
                          onSelected: (emotion) {
                            if (_selectedEmotions.contains(emotion)) {
                              setState(() {
                                _selectedEmotions.remove(emotion);
                                widget.onSelected(_selectedEmotions);
                              });
                            } else {
                              setState(() {
                                _selectedEmotions.add(emotion);
                                widget.onSelected(_selectedEmotions);
                              });
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
