import 'package:flutter/material.dart';

import 'l10n.dart';
import 'package:zentea/data/calendar/calendar_keys.dart';

class CalendarLocalization {
  static String month(BuildContext context, MonthsKeys mouth) {
    final l10n = context.l10n;

    switch (mouth) {
      case MonthsKeys.january:
        return l10n.january;
      case MonthsKeys.february:
        return l10n.february;
      case MonthsKeys.march:
        return l10n.march;
      case MonthsKeys.april:
        return l10n.april;
      case MonthsKeys.may:
        return l10n.may;
      case MonthsKeys.june:
        return l10n.june;
      case MonthsKeys.july:
        return l10n.july;
      case MonthsKeys.august:
        return l10n.august;
      case MonthsKeys.september:
        return l10n.september;
      case MonthsKeys.october:
        return l10n.october;
      case MonthsKeys.november:
        return l10n.november;
      case MonthsKeys.december:
        return l10n.december;
    }
  }

  static String weekDay(BuildContext context, WeekDaysKeys day) {
    final l10n = context.l10n;

    switch (day) {
      case WeekDaysKeys.mon:
        return l10n.mon;
      case WeekDaysKeys.tue:
        return l10n.tue;
      case WeekDaysKeys.wed:
        return l10n.wed;
      case WeekDaysKeys.thu:
        return l10n.thu;
      case WeekDaysKeys.fri:
        return l10n.fri;
      case WeekDaysKeys.sat:
        return l10n.sat;
      case WeekDaysKeys.sun:
        return l10n.sun;
    }
  }
}