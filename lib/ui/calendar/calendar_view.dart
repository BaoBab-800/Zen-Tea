import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/l10n/calendar_localization.dart';
import 'package:zentea/core/extensions/month_mapping_x.dart';
import 'package:zentea/core/extensions/date_time_x.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/calendar/calendar_day.dart';
import 'package:zentea/data/calendar/calendar_keys.dart';
import 'package:zentea/data/calendar/calendar_grid_state.dart';
import 'package:zentea/data/calendar/day_state.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/calendar/build_month_days.dart';
import 'package:zentea/services/calendar/calendar_activity_service.dart';

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
          child: Consumer<CalendarActivityService>(
            builder: (context, calendarActivity, _) {
              return _CalendarGrid(
                state: CalendarGridState(
                  month: currentMonth,
                  selectedDate: selectedDate,
                ),
                calendarDays: calendarActivity.days,
                onSelect: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              );
            },
          ),
        ),

        if (selectedDate != null)
          _SelectedDayDetails(
            day: context
                .watch<CalendarActivityService>()
                .dayByDate(selectedDate!),
          ),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  final CalendarGridState state;
  final List<CalendarDay> calendarDays;
  final void Function(DateTime date) onSelect;

  const _CalendarGrid({
    required this.state,
    required this.calendarDays,
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
        final calendarDay = _calendarDayFor(day);
        final hasActivity = calendarDay?.hasActivity ?? false;

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

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${day.day}'),
                const SizedBox(height: 4),
                if (hasActivity)
                  Icon(
                    calendarDay?.teaOfTheDay == null
                        ? Icons.circle
                        : Icons.local_cafe,
                    size: 8,
                    color: context.colors.primary,
                  )
                else
                  const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  CalendarDay? _calendarDayFor(DateTime date) {
    for (final day in calendarDays) {
      if (_isSameDay(day.date, date)) return day;
    }
    return null;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }
}

class _SelectedDayDetails extends StatelessWidget {
  final CalendarDay? day;

  const _SelectedDayDetails({required this.day});

  @override
  Widget build(BuildContext context) {
    final (state, icon) = _buildContent(day?.teaOfTheDay, day);
    final title = _getTitle(context, state, day?.teaOfTheDay);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),

        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  (DayState, IconData) _buildContent(TeaType? tea, CalendarDay? day) {
    if (day?.hasActivity != true) {
      return (DayState.noActivity, Icons.event_busy);
    }

    if (tea == null) {
      return (DayState.activityOnly, Icons.check_circle_outline);
    }

    return (DayState.teaSelected, Icons.emoji_food_beverage);
  }

  String _getTitle(BuildContext context, DayState state, TeaType? tea) {
    final l10n = context.l10n;

    switch (state) {
      case DayState.noActivity:
        return l10n.noActivityRecorded;

      case DayState.activityOnly:
        return l10n.activityRecorded;

      case DayState.teaSelected:
        return l10n.teaOfTheDay(tea!.title(context));
    }
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
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: PopupMenuButton<MonthsKeys>(
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
            ),
          ),

          const Spacer(),

          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
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
            ),
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