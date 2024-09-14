import 'package:emotional_app/constants/app_constants.dart';
import 'package:emotional_app/constants/color_constants.dart';
import 'package:emotional_app/constants/path_constants.dart';
import 'package:emotional_app/widgets/emotion_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  final ValueChanged<DateTime> onSelected;
  const CalendarPage({super.key, required this.onSelected});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<DateTime> _getMonths(DateTime firstMonth) {
    List<DateTime> months = [];
    DateTime currentMonth = firstMonth;
    for (int i = 0; i < 12; i++) {
      months.add(DateTime(currentMonth.year, currentMonth.month + i));
    }
    return months;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      appBar: AppBar(
        backgroundColor: AppColors.BACKGROUND,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: IconButton(
            icon: SvgPicture.asset(PathConstants.BACK_ICON),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.onSelected(DateTime.now());
                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  'Сегодня',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(188, 188, 191, 1),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 32,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < weekDays.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: i == 0 ? 0 : 9, right: i == 5 ? 0 : 9),
                          child: Text(
                            weekDays[i],
                            style: GoogleFonts.nunito(
                              height: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                              color: const Color(0XFFBCBCBD),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _calendarFormat == CalendarFormat.month ? 12 : 1,
              itemBuilder: (context, index) {
                DateTime month = _getMonths(_focusedDay)[index];

                return EmotionCalendar(
                  month: month,
                  focuseDate: _focusedDay,
                  onSelected: (date) {
                    _selectedDay = date;
                    widget.onSelected(date);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
