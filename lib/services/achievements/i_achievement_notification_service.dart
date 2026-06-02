import 'package:zentea/data/achievements/achievement_keys.dart';

abstract class IAchievementNotificationService {
  Future<IdKeys?> takeFirstUnshown({
    required Set<IdKeys> previouslyUnlocked,
    required Set<IdKeys> newlyUnlocked,
  });
}
