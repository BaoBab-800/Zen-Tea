import 'package:flutter/material.dart';

import 'l10n.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

class AchievementLocalization {
  String achievementTitle(BuildContext context, TitleKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case TitleKeys.tServeTenTeasAchievement:
        return l10n.tServeTenTeasAchievement;
      case TitleKeys.tFirstStepsAchievement:
        return l10n.tFirstStepsAchievement;
      case TitleKeys.tGetRareTeasAchievement:
        return l10n.tGetRareTeasAchievement;
      case TitleKeys.tLegendaryTeaAchievement:
        return l10n.tLegendaryTeaAchievement;
    }
  }

  String achievementDescription(BuildContext context, DescriptionKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case DescriptionKeys.dServeTenTeasAchievement:
        return l10n.dServeTenTeasAchievement;
      case DescriptionKeys.dFirstStepsAchievement:
        return l10n.dFirstStepsAchievement;
      case DescriptionKeys.dGetRareTeasAchievement:
        return l10n.dGetRareTeasAchievement;
      case DescriptionKeys.dLegendaryTeaAchievement:
        return l10n.dLegendaryTeaAchievement;
    }
  }
}