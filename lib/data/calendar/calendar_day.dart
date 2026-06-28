class CalendarDay {
  final DateTime date;
  final bool hasActivity;
  final String? teaOfTheDayId;

  const CalendarDay({
    required this.date,
    required this.hasActivity,
    this.teaOfTheDayId,
  });
}