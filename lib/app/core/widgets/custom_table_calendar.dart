import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatefulWidget {
  CustomTableCalendar({super.key});
  ValueNotifier<DateTime> selectDay = ValueNotifier<DateTime>(DateTime.now());

  @override
  State<CustomTableCalendar> createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: pageWidth / 3,
      height: 375,
      child: Card(
        color: CustomColors.cardColor,
        child: ValueListenableBuilder(
          valueListenable: widget.selectDay,
          builder: (_, daySelected, __) => TableCalendar(
            locale: "pt_BR",
            // calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            focusedDay: daySelected,
            firstDay: DateTime(1999),
            lastDay: DateTime(2050),
            onDaySelected: (selectedDay, focusedDay) {
              daySelected = selectedDay;
              print(selectedDay);
            },
          ),
        ),
      ),
    );
  }
}
