import 'package:flutter/material.dart';

import 'l10n.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

class AchievementLocalization {
  String achievementTitle(BuildContext context, TitleKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case TitleKeys.tServeTenTeasAchievement:
        return l10n.tServeTenTeasAchievement;
      case TitleKeys.tGetRareTeaAchievement:
        return l10n.tGetRareTeaAchievement;
    }
  }

  String achievementDescription(BuildContext context, DescriptionKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case DescriptionKeys.dServeTenTeasAchievement:
        return l10n.dServeTenTeasAchievement;
      case DescriptionKeys.dGetRareTeaAchievement:
        return l10n.dGetRareTeaAchievement;
    }
  }
}