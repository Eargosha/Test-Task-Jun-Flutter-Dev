import 'package:emotional_app/widgets/components/widget_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionalNotes extends StatefulWidget {
  final void Function(String) onSubmitted;

  const EmotionalNotes({
    super.key,
    required this.onSubmitted,
  });

  @override
  State<EmotionalNotes> createState() => _EmotionalNotesState();
}

class _EmotionalNotesState extends State<EmotionalNotes> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 121,
        width: 335,
        child: Column(
          children: [
            const SizedBox(
              width: 335,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetHeader(headerText: 'Заметки'),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: const [
                  BoxShadow(
                    color:  Color.fromRGBO(182, 161, 192, 0.11),
                    offset: Offset(2, 4),
                    blurRadius: 10,
                  )
                ],
              ),
              height: 90,
              child: TextField(
                
                controller: _controller,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
                onChanged: (value) {
                  widget.onSubmitted(_controller.text);
                },
                cursorColor: const Color.fromRGBO(35, 35, 43, 1),
                maxLines:
                    10, // Устанавливает количество строк, которое может отображаться в TextField
                keyboardType: TextInputType
                    .multiline, // Указывает, что это многострочный TextField
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Введите заметку',
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(188, 188, 191, 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0), // Добавляет отступы внутри TextField
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
