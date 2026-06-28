import 'package:zentea/data/teas/tea_types.dart';

class CalendarDay {
  final DateTime date;
  final bool hasActivity;
  final TeaType? teaOfTheDay;

  const CalendarDay({
    required this.date,
    required this.hasActivity,
    this.teaOfTheDay,
  });

  factory CalendarDay.fromStorage(Map<dynamic, dynamic> map) {
    final rawDate = map['date'];
    final date = rawDate is DateTime
        ? rawDate
        : DateTime.tryParse(rawDate?.toString() ?? '') ?? DateTime.now();
    final teaTypeName = map['teaOfTheDay']?.toString();

    return CalendarDay(
      date: DateTime(date.year, date.month, date.day),
      hasActivity: map['hasActivity'] == true,
      teaOfTheDay: teaTypeName == null
          ? null
          : TeaType.values
          .where((type) => type.name == teaTypeName)
          .firstOrNull,
    );
  }

  Map<String, dynamic> toStorage() => {
    'date': date.toIso8601String(),
    'hasActivity': hasActivity,
    'teaOfTheDay': teaOfTheDay?.name,
  };

  CalendarDay copyWith({
    DateTime? date,
    bool? hasActivity,
    TeaType? teaOfTheDay,
  }) {
    return CalendarDay(
      date: date ?? this.date,
      hasActivity: hasActivity ?? this.hasActivity,
      teaOfTheDay: teaOfTheDay ?? this.teaOfTheDay,
    );
  }
}