import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/app/app_router.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/services/stats/stats_provider.dart';

import 'home_statistics_section.dart';

class HomeFeedSection extends StatelessWidget {
  const HomeFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),

            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  _currentSeries(context),

                  const SizedBox(height: 8),
                  HomeStatisticsSection(),

                  const SizedBox(height: 32),
                  const Spacer(),
                  _buildCard(
                    context.l10n.getTeaForToday,
                    context,
                    Icons.emoji_food_beverage,
                    AppRoute.getTeaForToday,
                  ),

                  _buildCard(
                    context.l10n.teaMap,
                    context,
                    Icons.map,
                    AppRoute.teaMap,
                  ),

                  _buildCard(
                    context.l10n.teaCollection,
                    context,
                    Icons.menu_book,
                    AppRoute.teaCollection,
                  ),

                  _buildCard(
                    context.l10n.calendar,
                    context,
                    Icons.calendar_month,
                    AppRoute.calendar,
                  ),

                  _buildCard(
                    context.l10n.achievements,
                    context,
                    Icons.workspace_premium,
                    AppRoute.achievements,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _currentSeries(BuildContext context) {
    final stats = context.watch<StatsProvider>().stats;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
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
            stats.streakDays.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String content, BuildContext context, IconData icon, AppRoute route) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ListTile(
        title: Text(
          content,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        leading: Icon(
          icon,
          size: 22,
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