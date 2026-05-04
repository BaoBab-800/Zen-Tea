import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class ServeTenTeasAchievement extends Achievement {
  ServeTenTeasAchievement()
      : super(
    id: IdKeys.idServeTenTeasAchievement,
    titleKey: TitleKeys.tServeTenTeasAchievement,
    descriptionKey: DescriptionKeys.dServeTenTeasAchievement,
    icon: Icons.local_cafe,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.totalServed >= 10;
  }
}