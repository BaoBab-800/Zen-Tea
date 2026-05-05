import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class GetRareTeaAchievement extends Achievement {
  GetRareTeaAchievement()
      : super(
    id: IdKeys.idGetRareTeaAchievement,
    titleKey: TitleKeys.tGetRareTeaAchievement,
    descriptionKey: DescriptionKeys.dGetRareTeaAchievement,
    icon: Icons.star,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.rareTeasObtained >= 1;
  }
}