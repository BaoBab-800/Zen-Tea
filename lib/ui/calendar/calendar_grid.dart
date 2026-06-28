import 'package:flutter/material.dart';

import 'package:zentea/services/calendar/build_month_days.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDate;
  final void Function(DateTime) onSelect;

  const CalendarGrid({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final days = buildMonthDays(month);

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];

        if (day == null) {
          return const SizedBox();
        }

        final isSelected = selectedDate != null &&
            day.year == selectedDate!.year &&
            day.month == selectedDate!.month &&
            day.day == selectedDate!.day;

        return GestureDetector(
          onTap: () => onSelect(day),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.blueAccent
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${day.day}',
              ),
            ),
          ),
        );
      },
    );
  }
}