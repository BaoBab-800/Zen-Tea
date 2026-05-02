import 'package:flutter/cupertino.dart';

import 'list_of_achievements.dart';

class AchievementModel {
  final TitleKeys titleKey;
  final DescriptionKeys descriptionKey;
  final IconData icon;
  final bool isUnlocked;

  AchievementModel({
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    this.isUnlocked = false,
  });

  AchievementModel copyWith({
    TitleKeys? titleKey,
    DescriptionKeys? descriptionKey,
    IconData? icon,
    bool? isUnlocked,
  }) {
    return AchievementModel(
      titleKey: titleKey ?? this.titleKey,
      descriptionKey: descriptionKey ?? this.descriptionKey,
      icon: icon ?? this.icon,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}