import 'package:flutter/material.dart';

import 'achievement_model.dart';

enum TitleKeys {
  justTenTimes,
  allOfThem,
}

enum DescriptionKeys {
  saveYourTenDayStreak,
  collectAllTheTeas,
}

final List<AchievementModel> achievementsList = [
  AchievementModel(
    titleKey: TitleKeys.justTenTimes,
    descriptionKey: DescriptionKeys.saveYourTenDayStreak,
    icon: Icons.emoji_events,
    isUnlocked: true,
  ),

  AchievementModel(
    titleKey: TitleKeys.allOfThem,
    descriptionKey: DescriptionKeys.collectAllTheTeas,
    icon: Icons.emoji_events,
    isUnlocked: false,
  ),
];