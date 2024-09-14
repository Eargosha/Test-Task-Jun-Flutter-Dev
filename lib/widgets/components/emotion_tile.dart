import 'package:emotional_app/constants/color_constants.dart';
import 'package:emotional_app/presentation/models/emotion_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionTile extends StatefulWidget {
  final EmotionUiModel emotion;
  final bool isSelected;
  final ValueChanged<EmotionUiModel> onSelected;

  const EmotionTile({
    super.key,
    required this.emotion,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<EmotionTile> createState() => _EmotionTileState();
}

class _EmotionTileState extends State<EmotionTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.emotion);
      },
      child: SizedBox(
        height: 138,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 118,
              width: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(76),
                color: Colors.white,
                border: widget.isSelected
                    ? Border.all(
                        color: AppColors.MANDARIN,
                        width: 2,
                      )
                    : null,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 4),
                    blurRadius: 10.8,
                    color: Color.fromRGBO(182, 161, 192, 0.11),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 118,
              width: 83,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  SizedBox(
                    height: 50,
                    width: 53,
                    child: Image.asset(widget.emotion.imagePath),
                  ),
                  Text(
                    widget.emotion.title,
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
