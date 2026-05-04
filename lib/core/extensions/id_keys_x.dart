import 'package:zentea/data/achievements/achievement_keys.dart';

extension IdKeysX on IdKeys {
  static IdKeys? fromKey(String key) {
    for (final id in IdKeys.values) {
      if (id.key == key) return id;
    }
    return null;
  }
}