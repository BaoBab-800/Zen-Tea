import 'package:flutter/foundation.dart';

import 'package:zentea/data/calendar/calendar_day.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/calendar/i_calendar_activity_service.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

class CalendarActivityService extends ChangeNotifier
    implements ICalendarActivityService {
  static const _calendarDaysKey = 'calendar_days';

  final IKeyValueStorage _storage;
  final List<CalendarDay> _days = [];
  bool _isLoaded = false;

  CalendarActivityService(this._storage) {
    recordActivityForToday();
  }

  @override
  List<CalendarDay> get days => List.unmodifiable(_days);

  @override
  Future<void> recordActivityForToday() async {
    await _ensureLoaded();
    await _upsertDay(_today(), hasActivity: true);
  }

  @override
  Future<void> recordTeaForToday(TeaType teaType) async {
    await _ensureLoaded();
    await _upsertDay(_today(), hasActivity: true, teaOfTheDay: teaType);
  }

  @override
  Future<void> resetCalendar() async {
    await _ensureLoaded();
    _days.clear();
    await _storage.put(_calendarDaysKey, _days);
    notifyListeners();
  }

  @override
  CalendarDay? dayByDate(DateTime date) {
    final normalized = _normalize(date);
    for (final day in _days) {
      if (_isSameDay(day.date, normalized)) return day;
    }
    return null;
  }

  Future<void> _ensureLoaded() async {
    if (_isLoaded) return;

    final storedDays = await _storage.get<List<dynamic>>(_calendarDaysKey) ?? [];
    _days
      ..clear()
      ..addAll(
        storedDays
            .whereType<Map<dynamic, dynamic>>()
            .map(CalendarDay.fromStorage)
            .whereType<CalendarDay>(),
      );
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> _upsertDay(
      DateTime date, {
        required bool hasActivity,
        TeaType? teaOfTheDay,
      }) async {
    final normalized = _normalize(date);
    final index = _days.indexWhere((day) => _isSameDay(day.date, normalized));

    if (index == -1) {
      _days.add(
        CalendarDay(
          date: normalized,
          hasActivity: hasActivity,
          teaOfTheDay: teaOfTheDay,
        ),
      );
    } else {
      final current = _days[index];
      _days[index] = current.copyWith(
        hasActivity: current.hasActivity || hasActivity,
        teaOfTheDay: teaOfTheDay ?? current.teaOfTheDay,
      );
    }

    _days.sort((a, b) => a.date.compareTo(b.date));
    await _storage.put(
      _calendarDaysKey,
      _days.map((day) => day.toStorage()).toList(),
    );
    notifyListeners();
  }

  DateTime _today() => _normalize(DateTime.now());

  DateTime _normalize(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}