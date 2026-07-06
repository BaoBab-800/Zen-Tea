import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/services/stats/stats_provider.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsProvider>().stats;

    return Center(
      child: Column(
        children: [
          Text(context.l10n.stats),
          Divider(indent: 8, endIndent: 8),

          _StatsTile(
            value: stats.totalServed,
            title: context.l10n.totalTeasDrunk,
          ),

          _StatsTile(
            value: stats.uniqueTeas,
            title: context.l10n.totalTeasOpened,
          ),

          Text(context.l10n.profileOfThem),

          _StatsTile(
            value: stats.uniqueTeas - stats.rareTeasObtained,
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

          _StatsTile(
            value: stats.maxStreak,
            title: context.l10n.maximumSeries,
          ),

          Divider(indent: 8, endIndent: 8),
        ],
      ),
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
    return Text(
      '$title: $value',
    );
  }
}