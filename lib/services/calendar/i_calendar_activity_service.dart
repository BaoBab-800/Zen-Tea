import 'package:zentea/data/calendar/calendar_day.dart';
import 'package:zentea/data/teas/tea_types.dart';

abstract class ICalendarActivityService {
  List<CalendarDay> get days;

  Future<void> recordActivityForToday();

  Future<void> recordTeaForToday(TeaType teaType);

  CalendarDay? dayByDate(DateTime date);
}