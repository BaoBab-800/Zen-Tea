import 'package:zentea/core/extensions/id_keys_x.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/hive/hive_service.dart';

class AchievementsService {
  static const _boxName = 'achievements';
  static const _key = 'unlocked_achievements';

  final HiveService _hive;

  AchievementsService(this._hive);

  Set<IdKeys> loadUnlocked() {
    final stored = _hive.getValue<List>(
      boxName: _boxName,
      key: _key,
      defaultValue: <String>[],
    );

    return stored
        .whereType<String>()
        .map(IdKeysX.fromKey)
        .whereType<IdKeys>()
        .toSet();
  }

  Future<void> saveUnlocked(Set<IdKeys> ids) {
    final data = ids.map((e) => e.key).toList();
    return _hive.putValue(boxName: _boxName, key: _key, value: data);
  }

  Set<IdKeys> checkAchievements({
    required Set<IdKeys> currentUnlocked,
    required Stats stats,
  }) {
    final newUnlocked = <IdKeys>{};

    for (final achievement in allAchievements) {
      final id = achievement.id;

      if (!currentUnlocked.contains(id) && achievement.isUnlocked(stats)) {
        newUnlocked.add(id);
      }
    }

    return newUnlocked;
  }
}
