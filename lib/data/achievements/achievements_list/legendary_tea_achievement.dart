import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class LegendaryTeaAchievement extends Achievement {
  LegendaryTeaAchievement()
      : super(
    id: IdKeys.idLegendaryTeaAchievement,
    titleKey: TitleKeys.tLegendaryTeaAchievement,
    descriptionKey: DescriptionKeys.dLegendaryTeaAchievement,
    icon: Icons.diamond,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.legendaryTeasObtained >= 1;
  }
}