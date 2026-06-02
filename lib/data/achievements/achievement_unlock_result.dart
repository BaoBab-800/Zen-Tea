import 'package:zentea/data/achievements/achievement_keys.dart';

class AchievementUnlockResult {
  final Set<IdKeys> previouslyUnlocked;
  final Set<IdKeys> newlyUnlocked;

  const AchievementUnlockResult({
    required this.previouslyUnlocked,
    required this.newlyUnlocked,
  });
}
