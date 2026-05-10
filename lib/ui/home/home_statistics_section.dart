import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/services/stats/stats_provider.dart';

class HomeStatisticsSection extends StatelessWidget {
  const HomeStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsProvider>().stats;

    return Container(
      decoration: BoxDecoration(),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            _StatCard(
              label: context.l10n.totalTeasDrunk,
              value: stats.totalServed,
            ),

            const SizedBox(width: 8),
            _StatCard(
              label: context.l10n.totalTeasOpened,
              value: stats.totalQuestCompleted,
            ),

            const SizedBox(width: 8),
            _StatCard(
              label: context.l10n.maximumSeries,
              value: stats.maxStreak,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final int value;

  const _StatCard({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text('$label: $value'),
    );
  }
}