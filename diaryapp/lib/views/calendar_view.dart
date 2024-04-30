import 'package:diaryapp/views/widget/entries_view/entries.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarView();
}

class _CalendarView extends State<CalendarView> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void setDate(DateTime newDate, DateTime focusedDay) {
    setState(() {
      _selectedDate = newDate;
      _focusedDate = focusedDay;
    });
  }

  void setFormat(CalendarFormat newFormat) {
    setState(() {
      _calendarFormat = newFormat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          if (width < 600) {
            return Column(
              children: [
                TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.now(),
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDate,
                    selectedDayPredicate: (day) =>
                        isSameDay(_selectedDate, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setDate(selectedDay, focusedDay);
                    },
                    onFormatChanged: (format) {
                      setFormat(format);
                    },
                    onPageChanged: (focusDay) {
                      _focusedDate = focusDay;
                    }),
                Expanded(
                    child: Entries(forProfile: false, date: _selectedDate)),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: TableCalendar(
                      shouldFillViewport: true,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.now(),
                      calendarFormat: _calendarFormat,
                      focusedDay: _focusedDate,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDate, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setDate(selectedDay, focusedDay);
                      },
                      onFormatChanged: (format) {
                        setFormat(format);
                      },
                      onPageChanged: (focusDay) {
                        _focusedDate = focusDay;
                      }),
                ),
                Expanded(
                    child: Entries(forProfile: false, date: _selectedDate)),
              ],
            );
          }
        },
      ),
    );
  }
}
