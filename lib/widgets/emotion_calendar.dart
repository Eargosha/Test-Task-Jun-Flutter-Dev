import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class EmotionCalendar extends StatefulWidget {
  final ValueChanged<DateTime> onSelected;
  final DateTime focuseDate;
  final DateTime month;

  const EmotionCalendar(
      {super.key,
      required this.month,
      required this.focuseDate,
      required this.onSelected});

  @override
  State<EmotionCalendar> createState() => _EmotionCalendarState();
}

DateTime _selectedDay = DateTime.now();
List<DateTime> _selectedDays = [];
CalendarFormat _calendarFormat = CalendarFormat.month;

List<DateTime> _getMonths(DateTime firstMonth) {
  List<DateTime> months = [];
  DateTime currentMonth = firstMonth;
  for (int i = 0; i < 12; i++) {
    months.add(DateTime(currentMonth.year, currentMonth.month + i));
  }
  return months;
}

class _EmotionCalendarState extends State<EmotionCalendar> {
  @override
  void initState() {
    _selectedDays = [DateTime.now()];
    super.initState();
    _selectedDays = [DateTime.now()];
    print(_selectedDays);
  }

  void showPopupMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Сообщение'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late DateTime _focusedDay = widget.focuseDate;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SizedBox(
            width: 335,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    showPopupMessage(context,'Пока что представление в виде года не реализовано :(');
                  },
                  child: Text(
                    DateFormat('yyyy').format(widget.month),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color(0XFFBCBCBF),
                    ),
                  ),
                ),
                Text(
                    textAlign: TextAlign.start,
                    DateFormat('MMMM', 'ru_RU')
                            .format(widget.month)
                            .characters
                            .first
                            .toUpperCase() +
                        DateFormat('MMMM', 'ru_RU')
                            .format(widget.month)
                            .substring(1),
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: const Color(0XFF4C4C69),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 335,
            child: TableCalendar(
              availableGestures: AvailableGestures.none,
              rowHeight: 41,
              locale: 'ru_RU',
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: widget.month,
              calendarStyle: CalendarStyle(
                cellMargin: const EdgeInsets.all(0),
                cellPadding: const EdgeInsets.all(0),
                selectedDecoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 137, 2, 0.247),
                    shape: BoxShape.circle),
                todayDecoration: const BoxDecoration(
                    color: Color(0XFFFF8702), shape: BoxShape.circle),
                outsideDaysVisible: false,
                defaultTextStyle: GoogleFonts.nunito(
                  fontSize: 18,
                  color: const Color(0XFF4C4C69),
                  fontWeight: FontWeight.w500,
                ),
                todayTextStyle: GoogleFonts.nunito(
                  fontSize: 18,
                  color: const Color(0XFF4C4C69),
                  fontWeight: FontWeight.w500,
                ),
                selectedTextStyle: GoogleFonts.nunito(
                  fontSize: 18,
                  color: const Color(0XFF4C4C69),
                  fontWeight: FontWeight.w500,
                ),
                weekendTextStyle: GoogleFonts.nunito(
                  fontSize: 18,
                  color: const Color(0XFF4C4C69),
                  fontWeight: FontWeight.w500,
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              headerVisible: false,
              daysOfWeekVisible: false,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => _selectedDays.contains(day),
              onDaySelected: (selectedDay, focusedDay) {
                if (_selectedDays.contains(selectedDay)) {
                  setState(() {
                    _selectedDays.remove(selectedDay);
                  });
                } else {
                  setState(() {
                    _selectedDays = [selectedDay];
                    _selectedDay = selectedDay;
                    widget.onSelected(_selectedDays[0]);
                  });
                }
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                todayBuilder: (BuildContext context, date, events) {
                  bool isSelected = false;

                  if (_selectedDays.isNotEmpty) {
                    isSelected = _selectedDays[0].day == date.day &&
                        _selectedDays[0].month == date.month &&
                        _selectedDays[0].year == date.year;
                  } else {
                    isSelected = false;
                  }

                  print(_selectedDays);

                  if (DateTime.now().day == date.day &&
                      DateTime.now().month == date.month &&
                      DateTime.now().year == date.year) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: isSelected
                              ? const BoxDecoration(
                                  color: Color.fromRGBO(255, 137, 2, 0.24),
                                  shape: BoxShape.circle,
                                )
                              : const BoxDecoration(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              date.day.toString(),
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                color: const Color(0XFF4C4C69),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: Color(0XFFFF8702),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
                selectedBuilder: (BuildContext context, date, events) {
                  if (DateTime.now().day == date.day &&
                      DateTime.now().month == date.month &&
                      DateTime.now().year == date.year) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 137, 2, 0.24),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                date.day.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  color: const Color(0XFF4C4C69),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: Color(0XFFFF8702),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 137, 2, 0.24),
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            color: const Color(0XFF4C4C69),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
