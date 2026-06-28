import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/calendar_localization.dart';
import 'package:zentea/core/extensions/month_mapping_x.dart';
import 'package:zentea/core/extensions/date_time_x.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/calendar/calendar_keys.dart';
import 'package:zentea/data/calendar/calendar_grid_state.dart';

import 'package:zentea/services/calendar/build_month_days.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MonthHeader(
          month: currentMonth,
          onMonthSelected: (monthKey) {
            selectedDate = null;
            setState(() {
              currentMonth = DateTime(
                currentMonth.year,
                monthKey.toInt(),
              );
            });
          },

          onYearSelected: (year) {
            setState(() {
              currentMonth = DateTime(year, currentMonth.month);
              selectedDate = null;
            });
          },
        ),

        const Divider(),
        _WeekDaysRow(),

        const Divider(),
        Expanded(
          child: _CalendarGrid(
            state: CalendarGridState(
              month: currentMonth,
              selectedDate: selectedDate,
            ),
            onSelect: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  final CalendarGridState state;
  final void Function(DateTime date) onSelect;

  const _CalendarGrid({
    required this.state,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final days = buildMonthDays(state.month);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];

        if (day == null) {
          return const SizedBox();
        }

        final isSelected = state.selectedDate != null &&
            _isSameDay(day, state.selectedDate!);

        return GestureDetector(
          onTap: () => onSelect(day),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.primary.withValues(alpha: 0.3)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text('${day.day}'),
            ),
          ),
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }
}

class _MonthHeader extends StatelessWidget {
  final DateTime month;
  final void Function(MonthsKeys) onMonthSelected;
  final void Function(int year) onYearSelected;

  const _MonthHeader({
    required this.month,
    required this.onMonthSelected,
    required this.onYearSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4, left: 16, right: 16),
      child: Row(
        children: [
          PopupMenuButton<MonthsKeys>(
            onSelected: onMonthSelected,

            itemBuilder: (context) {
              return MonthsKeys.values.map((m) {
                return PopupMenuItem(
                  value: m,
                  child: Text(CalendarLocalization.month(context, m)),
                );
              }).toList();
            },

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  CalendarLocalization.month(context, month.toMonthKey()),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),

          const Spacer(),

          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => onYearSelected(month.year - 1),
          ),

          Text(
            '${month.year}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => onYearSelected(month.year + 1),
          ),
        ],
      ),
    );
  }
}

class _WeekDaysRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: WeekDaysKeys.values.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              CalendarLocalization.weekDay(context, day),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        );
      }).toList(),
    );
  }
}