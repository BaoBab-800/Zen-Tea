class CalendarState {
  final DateTime currentMonth;
  final DateTime? selectedDate;

  CalendarState({
    required this.currentMonth,
    this.selectedDate,
  });
}