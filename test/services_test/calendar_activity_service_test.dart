import 'package:flutter_test/flutter_test.dart';

import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/calendar/calendar_activity_service.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

class FakeKeyValueStorage implements IKeyValueStorage {
  final Map<String, Object?> _values = {};

  @override
  Future<T?> get<T>(String key) async => _values[key] as T?;

  @override
  Future<void> put<T>(String key, T value) async {
    _values[key] = value;
  }
}

void main() {
  group('CalendarActivityService', () {
    test('resetCalendar clears recorded calendar days from memory and storage', () async {
      final storage = FakeKeyValueStorage();
      final service = CalendarActivityService(storage);

      await service.recordTeaForToday(TeaType.greenTea);
      expect(service.days, isNotEmpty);

      await service.resetCalendar();

      expect(service.days, isEmpty);
      expect(
        await storage.get<List<dynamic>>('calendar_days'),
        isEmpty,
      );
    });
  });
}