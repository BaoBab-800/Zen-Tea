import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/l10n/achievement_localization.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/achievements/achievement_model.dart';
import 'package:zentea/services/achievements/achievements_service.dart';

class AchievementsBuilder extends StatelessWidget {
  const AchievementsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.achievements,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: ListView.builder(
        itemCount: context.watch<AchievementsService>().achievements.length,
        itemBuilder: (context, index) {
          final achievement = context.watch<AchievementsService>().achievements[index];
          return _achievementCard(context, achievement);
        },
      ),
    );
  }

  Widget _achievementCard(BuildContext context, AchievementModel achievement) {
    final localization = context.read<AchievementLocalization>();

    return Card(
      color: achievement.isUnlocked ? context.colors.primary : null,
      child: ListTile(
        leading: Icon(achievement.icon),

        title: Text(localization.achievementTitle(context, achievement.titleKey)),

        subtitle: Text(localization.achievementDescription(context, achievement.descriptionKey))
      ),
    );
  }
}