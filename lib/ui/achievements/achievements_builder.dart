import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/l10n/achievement_localization.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';

class AchievementsBuilder extends StatelessWidget {
  const AchievementsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final achievements = allAchievements;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.achievements,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 4.0),

          Expanded(
            child: ListView.builder(
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                return _achievementCard(context, achievement);
              },
            ),
          ),
        ],
      )
    );
  }

  Widget _achievementCard(BuildContext context, Achievement achievement) {
    final localization = context.watch<AchievementLocalization>();

    return FutureBuilder<Set<IdKeys>>(
      future: context.read<IAchievementsService>().loadUnlocked(),
      builder: (context, snapshot) {
        final unlocked = snapshot.data ?? <IdKeys>{};
        final isUnlocked = unlocked.contains(achievement.id);

        return Card(
          color: isUnlocked ? context.colors.primary : null,
          child: ListTile(
            leading: Icon(achievement.icon),
            title: Text(localization.achievementTitle(context, achievement.titleKey)),
            subtitle: Text(localization.achievementDescription(context, achievement.descriptionKey)),
          ),
        );
      },
    );
  }
}