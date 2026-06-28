import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'calendar_view.dart';

class CalendarPageBuilder extends StatefulWidget {
  const CalendarPageBuilder({super.key});

  @override
  State<CalendarPageBuilder> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPageBuilder> {
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.calendar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: CalendarView(),
    );
  }
}