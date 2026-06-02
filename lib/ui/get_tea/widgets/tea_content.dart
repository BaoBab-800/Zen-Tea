import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/quest/quest_result.dart';
import 'package:zentea/data/teas/tea_result.dart';
import 'package:zentea/services/get_tea/get_tea_flow_controller.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/url/url_service.dart';
import 'package:zentea/ui/get_tea/widgets/tea_card.dart';
import 'package:zentea/ui/history_of_teas/history_builder.dart';

class TeaContent extends StatelessWidget {
  final TeaResult result;
  final UrlService urlService;
  final GetTeaFlowController controller;

  const TeaContent({
    super.key,
    required this.result,
    required this.urlService,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final tea = result.tea;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TeaCard(tea: tea),
            const SizedBox(height: 24),
            Text(
              result.isNew
                  ? context.l10n.newTea
                  : context.l10n.teaServedTimes(result.tea.timesServed),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _completeQuest(context),
              child: Text(context.l10n.questCompleted),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HistoryBuilder(currentTea: tea),
                  ),
                );
              },
              child: Text(context.l10n.readTheStory),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                urlService.open(tea.url);
              },
              child: Text(context.l10n.goToWiki),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _completeQuest(BuildContext context) async {
    final questResult = await controller.completeQuest(
      questProgressService: context.read<QuestProgressService>(),
      statsProvider: context.read<StatsProvider>(),
    );

    if (!context.mounted) return;

    if (questResult.status == QuestCompletionStatus.alreadyDoneToday) {
      _showSeriesSnackBar(context);
    }
  }

  void _showSeriesSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.local_fire_department, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                context.l10n.completedQuestSeries,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        backgroundColor: context.colors.primary.withValues(alpha: 0.8),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
