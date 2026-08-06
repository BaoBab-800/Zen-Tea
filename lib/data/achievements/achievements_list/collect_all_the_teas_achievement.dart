import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

class CollectAllTheTeasAchievement extends Achievement {
  const CollectAllTheTeasAchievement()
      : super(
    id: IdKeys.idCollectAllTheTeasAchievement,
    titleKey: TitleKeys.tCollectAllTheTeasAchievement,
    descriptionKey: DescriptionKeys.dCollectAllTheTeasAchievement,
    icon: Icons.emoji_events,
  );

  @override
  bool isUnlocked(Stats stats) {
    return stats.uniqueTeas >= 30;
  }
}