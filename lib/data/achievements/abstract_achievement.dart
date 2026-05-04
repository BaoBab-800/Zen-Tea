import 'package:flutter/material.dart';

import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

abstract class Achievement {
  final IdKeys id;
  final TitleKeys titleKey;
  final DescriptionKeys descriptionKey;
  final IconData icon;

  const Achievement({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
  });

  bool isUnlocked(Stats stats);
}