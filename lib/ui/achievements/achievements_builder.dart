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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: isUnlocked ? LinearGradient(
                colors: [
                  lighten(context.colors.primary, 0.1),
                  context.colors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ) : LinearGradient(
                colors: [
                  context.colors.surfaceContainerLow,
                  context.colors.surfaceContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.circular(16),
            ),

            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),

              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isUnlocked
                      ? context.colors.onPrimary.withValues(alpha: 0.15)
                      : null,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: isUnlocked ? Icon(
                  achievement.icon,
                  color: isUnlocked ? Colors.white : null,
                ) : Icon(Icons.lock),
              ),

              title: Text(
                localization.achievementTitle(context, achievement.titleKey),
                style: TextStyle(
                  color: isUnlocked ? Colors.white : null,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                localization.achievementDescription(
                  context,
                  achievement.descriptionKey,
                ),
                style: TextStyle(
                  color: isUnlocked ? Colors.white : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}