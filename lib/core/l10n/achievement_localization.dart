import 'package:flutter/material.dart';

import 'l10n.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';

class AchievementLocalization {
  String achievementTitle(BuildContext context, TitleKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case TitleKeys.justTenTimes:
        return l10n.achievementTitleJustTenTimes;

      case TitleKeys.allOfThem:
        return l10n.achievementTitleAllOfThem;
    }
  }

  String achievementDescription(BuildContext context, DescriptionKeys key) {
    final l10n = context.l10n;

    switch (key) {
      case DescriptionKeys.saveYourTenDayStreak:
        return l10n.achievementDescriptionSaveYourTenDayStreak;

      case DescriptionKeys.collectAllTheTeas:
        return l10n.achievementDescriptionCollectAllTheTeas;
    }
  }
}