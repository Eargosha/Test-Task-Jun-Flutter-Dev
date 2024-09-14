import 'package:emotional_app/presentation/models/emotion_ui_model.dart';
import 'package:emotional_app/widgets/components/emotion_details.dart';
import 'package:emotional_app/widgets/components/emotion_tile.dart';
import 'package:emotional_app/widgets/components/widget_header.dart';
import 'package:flutter/material.dart';

class EmotionTypeSelector extends StatefulWidget {
  final ValueChanged<List<EmotionUiModel>> onSelectedEmotions;
  final ValueChanged<List<String>> onSelectedSubEmotions;
  final List<EmotionUiModel> emotions;

  const EmotionTypeSelector({
    super.key,
    required this.onSelectedEmotions,
    required this.onSelectedSubEmotions,
    required this.emotions,
  });

  @override
  State<EmotionTypeSelector> createState() => _EmotionTypeSelectorState();
}

class _EmotionTypeSelectorState extends State<EmotionTypeSelector> {
  List<EmotionUiModel> _selectedEmotions = [];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 335,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHeader(headerText: 'Что чувствуешь?'),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(
            // height: 118,
            // width: 335,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Row(
                  children: List.generate(
                    widget.emotions.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: EmotionTile(
                        emotion: widget.emotions[index],
                        isSelected: _selectedEmotions.contains(widget.emotions[index]),
                        onSelected: (emotion) {
                          if (_selectedEmotions.contains(emotion)) {
                            setState(() {
                              _selectedEmotions.remove(emotion);
                              widget.onSelectedEmotions(_selectedEmotions);
                            });
                          } else {
                            setState(() {
                              _selectedEmotions.add(emotion);
                              widget.onSelectedEmotions(_selectedEmotions);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 335,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedEmotions.isNotEmpty) const SizedBox(height: 10),
                if (_selectedEmotions.isNotEmpty)
                  EmotionDetails(
                    onSelected: (value) {
                      widget.onSelectedSubEmotions(value);
                    },
                    emotion: _selectedEmotions.last,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
