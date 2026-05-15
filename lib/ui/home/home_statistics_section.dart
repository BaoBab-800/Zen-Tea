import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/services/stats/stats_provider.dart';

class HomeStatisticsSection extends StatelessWidget {
  const HomeStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsProvider>().stats;

    return SizedBox(
      height: 136,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _StatCard(
            label: context.l10n.totalTeasDrunk,
            value: stats.totalServed,
            icon: Icons.emoji_food_beverage_rounded,
          ),

          const SizedBox(width: 12),
          _StatCard(
            label: context.l10n.totalTeasOpened,
            value: stats.uniqueTeas,
            icon: Icons.local_florist_rounded,
          ),

          const SizedBox(width: 12),
          _StatCard(
            label: context.l10n.maximumSeries,
            value: stats.maxStreak,
            icon: Icons.local_fire_department_rounded,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final int value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 132,
        minHeight: 120,
      ),

      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colors.primary.withValues(alpha: 0.7),
              context.colors.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: context.colors.primary.withValues(alpha: 0.18),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 22,
                color: context.colors.onPrimary,
              ),

              const Spacer(),

              Text(
                '$value',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onPrimary,
                ),
              ),

              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.colors.onPrimary.withValues(
                    alpha: 0.88,
                  ),
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}