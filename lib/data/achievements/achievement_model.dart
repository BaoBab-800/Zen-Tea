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
}