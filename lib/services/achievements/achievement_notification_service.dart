import 'package:zentea/core/extensions/id_keys_x.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/services/achievements/i_achievement_notification_service.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

class AchievementNotificationService implements IAchievementNotificationService {
  static const _shownAchievementNotificationsKey =
      'shown_achievement_notifications';

  final IKeyValueStorage _storage;

  AchievementNotificationService(this._storage);

  @override
  Future<IdKeys?> takeFirstUnshown({
    required Set<IdKeys> previouslyUnlocked,
    required Set<IdKeys> newlyUnlocked,
  }) async {
    if (newlyUnlocked.isEmpty) return null;

    final shownNotifications = await _loadShownAchievementNotifications();
    IdKeys? achievementToShow;

    for (final id in newlyUnlocked) {
      if (!previouslyUnlocked.contains(id) && !shownNotifications.contains(id)) {
        achievementToShow = id;
        break;
      }
    }

    await _saveShownAchievementNotifications({
      ...shownNotifications,
      ...previouslyUnlocked,
      ...newlyUnlocked,
    });

    return achievementToShow;
  }

  Future<Set<IdKeys>> _loadShownAchievementNotifications() async {
    final stored = await _storage.get(_shownAchievementNotificationsKey);

    if (stored is! Iterable) return <IdKeys>{};

    return stored
        .whereType<String>()
        .map(IdKeysX.fromKey)
        .whereType<IdKeys>()
        .toSet();
  }

  Future<void> _saveShownAchievementNotifications(Set<IdKeys> ids) {
    return _storage.put<List<String>>(
      _shownAchievementNotificationsKey,
      ids.map((id) => id.key).toList(),
    );
  }
}
