import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/services/stats/stats_provider.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsProvider>().stats;

    return Column(
      children: [
        const SizedBox(height: 4),
        Text(
          context.l10n.stats,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Container(
          width: 70,
          height: 1,
          color: context.colors.primary,
        ),

        const SizedBox(height: 4),
        Text(context.l10n.profileGeneral),

        _StatsTile(
          value: stats.totalServed,
          title: context.l10n.totalTeasDrunk,
        ),

        _StatsTile(
          value: stats.uniqueTeas,
          title: context.l10n.totalTeasOpened,
        ),

        Text(context.l10n.profileByRarity),

        _StatsTile(
          value: stats.uniqueTeas
              - stats.rareTeasObtained
              - stats.legendaryTeasObtained,
          title: context.l10n.common,
        ),

        _StatsTile(
          value: stats.rareTeasObtained,
          title: context.l10n.rare,
        ),

        _StatsTile(
          value: stats.legendaryTeasObtained,
          title: context.l10n.legendary,
        ),

        Text(context.l10n.profileActivity),

        _StatsTile(
          value: stats.maxStreak,
          title: context.l10n.maximumSeries,
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _StatsTile extends StatelessWidget {
  final int value;
  final String title;

  const _StatsTile({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 2),

          Row(
            children: [
              Text(
                '$title:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
              ),

              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$value',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 2),
        ],
      ),
    );
  }
}