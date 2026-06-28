List<DateTime?> buildMonthDays(DateTime month) {
  final firstDay = DateTime(month.year, month.month, 1);

  final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

  final startWeekday = firstDay.weekday;

  List<DateTime?> days = [];

  for (int i = 1; i < startWeekday; i++) {
    days.add(null);
  }

  for (int i = 1; i <= daysInMonth; i++) {
    days.add(DateTime(month.year, month.month, i));
  }

  return days;
}