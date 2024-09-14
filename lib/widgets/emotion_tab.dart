import 'package:emotional_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionTab extends StatefulWidget {
  final String? firstText;
  final String? secondText;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final String? firstSVG;
  final String? secondSVG;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const EmotionTab({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    this.firstText,
    this.secondText,
    this.firstIcon,
    this.secondIcon,
    this.firstSVG,
    this.secondSVG,
  }) : super(key: key);

  @override
  State<EmotionTab> createState() => _EmotionTabState();
}

class _EmotionTabState extends State<EmotionTab>
    with SingleTickerProviderStateMixin {
  bool _switchValue = false;
  late AnimationController _animationController;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.initialValue;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _switchValue = !_switchValue;
            if (_switchValue) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            widget.onChanged(_switchValue);
          });
        },
        child: Container(
          width: 288,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(47),
            color: AppColors.GREY,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Первая часть переключателя
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(47),
                  color: _switchValue
                      ? AppColors.MANDARIN
                      : AppColors.GREY,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                  child: Row(
                    children: [
                      if (widget.firstSVG != null)
                        SvgPicture.asset(
                          widget.firstSVG!,
                          color: _switchValue ? Colors.white : Colors.grey,
                          width: 12,
                          height: 12,
                        ),
                      if (widget.firstText != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            textAlign: TextAlign.right,
                            widget.firstText!,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              color: _switchValue ? Colors.white : Colors.grey,
                              fontSize: 12,
                              height: 1,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Вторая часть переключателя (аналогично первой)
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(47),
                  color: !_switchValue
                      ? AppColors.MANDARIN
                      : AppColors.GREY,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                  child: Row(
                    children: [
                      if (widget.secondSVG != null)
                        SvgPicture.asset(
                          widget.secondSVG!,
                          color: !_switchValue ? Colors.white : Colors.grey,
                          width: 12,
                          height: 12,
                        ),
                      if (widget.secondText != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            textAlign: TextAlign.right,
                            widget.secondText!,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              color: !_switchValue ? Colors.white : Colors.grey,
                              fontSize: 12,
                              height: 1,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
