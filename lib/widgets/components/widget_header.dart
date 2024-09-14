import 'package:emotional_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetHeader extends StatelessWidget {
  final String headerText;

  const WidgetHeader({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      textAlign: TextAlign.left,
      style: GoogleFonts.nunito(
        fontWeight: FontWeight.w800,
        fontSize: 16,
        letterSpacing: 0,
        color: AppColors.TEXT_BLACK,
      ),
    );
  }
}
