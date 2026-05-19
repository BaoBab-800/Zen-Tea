import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

abstract class IAchievementsService {
  Future<Set<IdKeys>> loadUnlocked();

  Set<IdKeys> checkAchievements({
    required Set<IdKeys> currentUnlocked,
    required Stats stats,
  });

  Future<void> saveUnlocked(Set<IdKeys> ids);
}