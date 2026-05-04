import 'package:hive_flutter/hive_flutter.dart';

import 'package:zentea/core/extensions/id_keys_x.dart';

import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';

class AchievementsService {
  static const _key = 'unlocked_achievements';

  final Box<List> _box = Hive.box<List>('achievements');

  Set<IdKeys> loadUnlocked() {
    final stored = _box.get(_key)?.cast<String>() ?? [];

    return stored
        .map(IdKeysX.fromKey)
        .whereType<IdKeys>()
        .toSet();
  }

  Future<void> saveUnlocked(Set<IdKeys> ids) async {
    final data = ids.map((e) => e.key).toList();
    await _box.put(_key, data);
  }

  Set<IdKeys> checkAchievements({
    required Set<IdKeys> currentUnlocked,
    required Stats stats,
  }) {
    final newUnlocked = <IdKeys>{};

    for (final achievement in allAchievements) {
      final id = achievement.id;

      if (!currentUnlocked.contains(id) &&
          achievement.isUnlocked(stats)) {
        newUnlocked.add(id);
      }
    }

    return newUnlocked;
  }
}