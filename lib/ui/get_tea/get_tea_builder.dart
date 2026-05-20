import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/l10n/achievement_localization.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/data/teas/tea_result.dart';
import 'package:zentea/data/quest/quest_result.dart';
import 'package:zentea/services/stats/stats_provider.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/url/url_service.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';

import 'package:zentea/ui/get_tea/get_tea_flow_controller.dart';
import 'package:zentea/ui/history_of_teas/history_builder.dart';

class GetTeaBuilder extends StatefulWidget {
  final UrlService urlService;

  const GetTeaBuilder({
    super.key,
    required this.urlService,
  });

  @override
  State<GetTeaBuilder> createState() => _GetTeaBuilderState();
}

class _GetTeaBuilderState extends State<GetTeaBuilder> {
  late final Future<TeaResult> _future;
  final GetTeaFlowController _controller = const GetTeaFlowController();
  bool _isTeaReceivedProcessed = false;

  @override
  void initState() {
    super.initState();

    final todayTeaService = context.read<TodayTeaService>();
    final teaCollectionService = context.read<TeaCollectionService>();

    _future = _controller.getTodayTea(
      todayTeaService: todayTeaService,
      teaCollectionService: teaCollectionService,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialogIfNeeded();
    });
  }

  void _showWelcomeDialogIfNeeded() {
    final teaCollectionService = context.read<TeaCollectionService>();

    if (teaCollectionService.hasSeenDialog()) return;

    showDialog(
      context: context,
      builder: (_) => _buildWelcomeDialog(context),
    );

    teaCollectionService.setDialogSeen();
  }

  Widget _buildWelcomeDialog(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.aboutQuiz),

      content: Text(context.l10n.getTeaWarning),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(context.l10n.ok),
        ),
      ],
    );
  }

  Future<void> _processTeaReceived(TeaResult result) async {
    if (_isTeaReceivedProcessed) return;
    _isTeaReceivedProcessed = true;

    final statsProvider = context.read<StatsProvider>();
    final newUnlocked = await _controller.processTeaReceived(
      statsProvider: statsProvider,
      tea: result.tea,
      isNew: result.isNew,
      shouldCountServing: result.shouldCountServing,
    );

    if (!mounted || newUnlocked.isEmpty) return;

    final localization = AchievementLocalization();
    final achievement = _controller.getAchievementById(newUnlocked.first);

    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          '${context.l10n.newAchievement}: '
              '${localization.achievementTitle(context, achievement.titleKey)}',
        ),
        leading: const Icon(Icons.emoji_events),
        backgroundColor: context.colors.primary.withValues(alpha: 0.12),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(context.l10n.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.todayTea,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: _buildWelcomeDialog,
              );
            },

            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),

      body: FutureBuilder<TeaResult>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final result = snapshot.data!;
          _processTeaReceived(result);
          return _TeaContent(
            result: result,
            urlService: widget.urlService,
          );
        },
      ),
    );
  }
}

class _TeaContent extends StatelessWidget {
  final TeaResult result;
  final UrlService urlService;

  const _TeaContent({
    required this.result,
    required this.urlService,
  });

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

  @override
  Widget build(BuildContext context) {
    final tea = result.tea;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TeaCard(tea: tea),

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

            // ACTION BLOCK
            ElevatedButton(
              onPressed: () async {
                final service = context.read<QuestProgressService>();
                final questResult = await service.completeQuest();

                if (!context.mounted) return;

                if (questResult.status == QuestCompletionStatus.alreadyDoneToday) {
                  _showSeriesSnackBar(context);
                }
              },
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
}

class _TeaCard extends StatelessWidget {
  final TeaModel tea;

  const _TeaCard({required this.tea});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.colors.surface,
        ),

        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: Image.asset(
                  tea.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              tea.type.title(context),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}