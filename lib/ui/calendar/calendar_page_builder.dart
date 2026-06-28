import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'calendar_grid.dart';

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

      body: Column(
        children: [
          _MonthHeader(),
          _WeekDaysRow(),
          Expanded(
            child: CalendarGrid(
              month: currentMonth,
              selectedDate: selectedDate,
              onSelect: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Июнь 2026',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class _WeekDaysRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const days = ['Пн','Вт','Ср','Чт','Пт','Сб','Вс'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((d) => Expanded(
        child: Center(child: Text(d)),
      ))
          .toList(),
    );
  }
}