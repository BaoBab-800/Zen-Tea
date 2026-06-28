import 'package:zentea/data/calendar/calendar_keys.dart';

extension DateTimeMonthX on DateTime {
  MonthsKeys toMonthKey() {
    switch (month) {
      case 1:
        return MonthsKeys.january;
      case 2:
        return MonthsKeys.february;
      case 3:
        return MonthsKeys.march;
      case 4:
        return MonthsKeys.april;
      case 5:
        return MonthsKeys.may;
      case 6:
        return MonthsKeys.june;
      case 7:
        return MonthsKeys.july;
      case 8:
        return MonthsKeys.august;
      case 9:
        return MonthsKeys.september;
      case 10:
        return MonthsKeys.october;
      case 11:
        return MonthsKeys.november;
      case 12:
        return MonthsKeys.december;
      default:
        throw Exception('Invalid month');
    }
  }
}