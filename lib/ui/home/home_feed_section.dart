import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/app/app_router.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/services/quest_progress/quest_progress_service.dart';

import 'home_statistics_section.dart';

class HomeFeedSection extends StatelessWidget {
  const HomeFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 4),

        // A widget displaying the current series
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_fire_department,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                context.l10n.currentTeaSeries,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 2),
              Text(
                '${context.watch<QuestProgressService>().streak}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        _buildCard(context.l10n.getTeaForToday, context, AppRoute.getTeaForToday),

        _buildCard(context.l10n.teaCollection, context, AppRoute.teaCollection),

        _buildCard(context.l10n.whatKindOfTeaAreYouQuiz, context, AppRoute.whatKindOfTeaAreYouQuiz),

        _buildCard(context.l10n.achievements, context, AppRoute.achievements),

        const SizedBox(height: 8),
        HomeStatisticsSection(),
      ],
    );
  }

  Widget _buildCard(String content, BuildContext context, AppRoute route) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: ListTile(
        title: Text(
          content,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        onTap: () {
          context.pushRoute(route);
        },
      ),
    );
  }
}