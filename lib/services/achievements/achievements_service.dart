import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/stats/stats.dart';

import '../storage/i_key_value_storage.dart';
import 'i_achievements_service.dart';

class AchievementsService implements IAchievementsService {
  static const _key = 'unlocked_achievements';

  final IKeyValueStorage storage;

  AchievementsService(this.storage);

  @override
  Future<Set<IdKeys>> loadUnlocked() async {
    final stored = await storage.get(_key);

    if (stored is! Iterable) return <IdKeys>{};

    return stored
        .whereType<String>()
        .whereType<IdKeys>()
        .toSet();
  }

  @override
  Set<IdKeys> checkAchievements({
    required Set<IdKeys> currentUnlocked,
    required Stats stats,
  }) {
    final newUnlocked = <IdKeys>{};

    for (final achievement in allAchievements) {
      final id = achievement.id;

      final alreadyUnlocked = currentUnlocked.contains(id);
      final shouldUnlock = achievement.isUnlocked(stats);

      if (!alreadyUnlocked && shouldUnlock) {
        newUnlocked.add(id);
      }
    }

    return newUnlocked;
  }

  @override
  Future<void> saveUnlocked(Set<IdKeys> ids) async {
    final data = ids.map((e) => e.key).toList();
    await storage.put<List<String>>(_key, data);
  }
}