import 'package:emotional_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubEmotionTile extends StatefulWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const SubEmotionTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<SubEmotionTile> createState() => _SubEmotionTileState();
}

class _SubEmotionTileState extends State<SubEmotionTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.title);
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              widget.isSelected ? AppColors.MANDARIN : Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(182, 161, 192, 0.11),
              blurRadius: 10,
              offset: Offset(2, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              letterSpacing: 0,
              height: 1.35,
              color: widget.isSelected
                  ? Colors.white
                  : AppColors.TEXT_BLACK,
            ),
          ),
        ),
      ),
    );
  }
}
