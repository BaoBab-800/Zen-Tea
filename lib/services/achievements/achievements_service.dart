import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:zentea/data/achievements/achievement_model.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';

class AchievementsService extends ChangeNotifier {
  static const _achievementsKey = 'achievements_data';

  final Box _box = Hive.box('achievements');
  late final List<AchievementModel> _achievements;

  AchievementsService() {
    final storedData = _box.get(_achievementsKey) as Map?;

    _achievements = achievementsList.map((achievement) {
      final key = achievement.titleKey.name;
      final isUnlocked = storedData?[key] == true;

      return achievement.copyWith(isUnlocked: isUnlocked);
    }).toList();
  }

  List<AchievementModel> get achievements => List.unmodifiable(_achievements);

  Future<void> setUnlocked(TitleKeys titleKey, bool value) async {
    final index = _achievements.indexWhere((a) => a.titleKey == titleKey);

    if (index == -1 || _achievements[index].isUnlocked == value) return;

    _achievements[index] = _achievements[index].copyWith(isUnlocked: value);

    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final data = {
      for (final achievement in _achievements)
        achievement.titleKey.name: achievement.isUnlocked,
    };

    await _box.put(_achievementsKey, data);
  }
}