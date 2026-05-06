import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/services/stats/stats_service.dart';

class HomeStatisticsSection extends StatelessWidget {
  const HomeStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final statsService = context.read<StatsService>();

    final stats = statsService.getStats();

    return Container(
      decoration: BoxDecoration(),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Text(
                '${context.l10n.teaCollected} ${stats.uniqueTeas}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}