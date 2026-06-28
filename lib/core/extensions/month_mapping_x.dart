import 'package:zentea/data/calendar/calendar_keys.dart';

extension MonthMapping on int {
  MonthsKeys toMonthKey() {
    switch (this) {
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

extension MonthsKeysX on MonthsKeys {
  int toInt() {
    switch (this) {
      case MonthsKeys.january:
        return 1;
      case MonthsKeys.february:
        return 2;
      case MonthsKeys.march:
        return 3;
      case MonthsKeys.april:
        return 4;
      case MonthsKeys.may:
        return 5;
      case MonthsKeys.june:
        return 6;
      case MonthsKeys.july:
        return 7;
      case MonthsKeys.august:
        return 8;
      case MonthsKeys.september:
        return 9;
      case MonthsKeys.october:
        return 10;
      case MonthsKeys.november:
        return 11;
      case MonthsKeys.december:
        return 12;
    }
  }
}