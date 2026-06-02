import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';
import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/achievements/abstract_achievement.dart';

class AchievementNotifications {
  const AchievementNotifications._();

  static void showUnlocked({
    required BuildContext context,
    required Achievement achievement,
  }) {
    final localization = AchievementLocalization();

    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          '${context.l10n.newAchievement}: '
          '${localization.achievementTitle(context, achievement.titleKey)}',
        ),
        leading: const Icon(Icons.emoji_events),
        backgroundColor: context.colors.primary.withValues(alpha: 0.12),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(context.l10n.ok),
          ),
        ],
      ),
    );
  }
}
