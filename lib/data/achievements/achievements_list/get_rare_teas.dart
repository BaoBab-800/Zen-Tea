import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class GetRareTeasAchievement extends Achievement {
  GetRareTeasAchievement()
      : super(
    id: IdKeys.idGetRareTeasAchievement,
    titleKey: TitleKeys.tGetRareTeasAchievement,
    descriptionKey: DescriptionKeys.dGetRareTeasAchievement,
    icon: Icons.star,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.rareTeasObtained >= 3;
  }
}