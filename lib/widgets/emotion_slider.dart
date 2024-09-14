import 'package:emotional_app/constants/color_constants.dart';
import 'package:emotional_app/widgets/components/widget_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// ignore: must_be_immutable
class EmotionSlider extends StatefulWidget {
  final String leftText;
  final String rightText;
  final String sliderHeader;
  double sliderValue;
  final ValueChanged<double> onChanged;

  EmotionSlider({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.sliderHeader,
    required this.sliderValue,
    required this.onChanged,
  });

  @override
  State<EmotionSlider> createState() => _EmotionSliderState();
}

bool isChanged = false;

class _EmotionSliderState extends State<EmotionSlider> {
  Color _acriveSliderColor = Color.fromRGBO(225, 221, 216, 1);
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 108,
          // width: 335,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 335,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetHeader(headerText: widget.sliderHeader),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 77,
                    width: 335,
                    decoration: BoxDecoration(
                      //TODO: Законстантить тень, везде одинаковая
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 4),
                            color: Color.fromRGBO(182, 161, 192, 0.11),
                            blurRadius: 10),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 317,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Row(
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: i == 6 ? 0 : 61),
                                      width: 2,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColors.SLIDER_WHITE,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    SizedBox(
                                      width: i == 5 ? 0 : 60.5,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 16, top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.leftText,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.SLIDER_GREY),
                              ),
                              Text(
                                widget.rightText,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.SLIDER_GREY),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 33.0),
                child: SfSliderTheme(
                  data: const SfSliderThemeData(
                    thumbRadius: 9,
                    overlayRadius: 0,
                  ),
                  child: SizedBox(
                    height: 18,
                    width: 333,
                    child: SfSlider(
                      onChangeStart: (val) {
                        setState(() {
                          _acriveSliderColor = AppColors.MANDARIN;
                        });
                      },
                      max: 100,
                      activeColor: _acriveSliderColor,
                      inactiveColor: AppColors.SLIDER_WHITE,
                      min: 0,
                      interval: 6,
                      value: widget.sliderValue,
                      onChanged: (p0) {
                        setState(() {
                          isChanged = true;
                          widget.onChanged(p0);
                        });
                      },
                      thumbIcon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _acriveSliderColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
