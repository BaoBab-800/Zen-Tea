import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class FirstStepsAchievement extends Achievement {
  FirstStepsAchievement()
      : super(
    id: IdKeys.idFirstStepsAchievement,
    titleKey: TitleKeys.tFirstStepsAchievement,
    descriptionKey: DescriptionKeys.dFirstStepsAchievement,
    icon: Icons.directions_walk,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.uniqueTeas >= 3;
  }
}