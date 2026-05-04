import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/l10n/app_localizations.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/data/teas/tea_result.dart';
import 'package:zentea/data/quest/quest_result.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/url/url_service.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';

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

  @override
  void initState() {
    super.initState();

    final service = context.read<TodayTeaService>();
    final teaCollectionService = context.read<TeaCollectionService>();
    final teas = teaCollectionService.teas;

    _future = Future.microtask(() {
      return getTodayTea(service, teaCollectionService, teas);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final teaCollectionService = context.read<TeaCollectionService>();

      if (!teaCollectionService.hasSeenDialog()) {
        showDialog(
          context: context,
          builder: (_) => _showWelcomeDialog(context),
        );

        teaCollectionService.setDialogSeen();
      }
    });
  }

  Widget _showWelcomeDialog(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.aboutQuiz),

      content: Text(
        context.l10n.getTeaWarning,
      ),

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

  void showSeriesSnackBarMessage(
      BuildContext context,
      int result,
      String Function(AppLocalizations l10n) messageBuilder,
      ) {
    final text = messageBuilder(context.l10n);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_fire_department, color: Colors.white),
            const SizedBox(width: 8),
            Text(text + result.toString()),
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
                builder: _showWelcomeDialog,
              );
            },

            icon: Icon(Icons.info_outline),
          ),
        ],
      ),

      body: FutureBuilder<TeaResult>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final result = snapshot.data!;
          return _buildContent(context, result, widget.urlService);
        },
      ),
    );
  }

  Future<TeaResult> getTodayTea(
      TodayTeaService todayTeaService,
      TeaCollectionService teaCollectionService,
      List<TeaModel> teas,
      ) async {
    final tea = await todayTeaService.getTeaOfToday(teas);

    final existing = teaCollectionService.teas
        .firstWhere((item) => item.type == tea.type);

    final isNew = !existing.isUnlocked;
    final shouldCountServing = await todayTeaService.shouldCountServingForToday();

    await teaCollectionService.unlockTea(tea);

    if (shouldCountServing) {
      await teaCollectionService.incrementServed(tea);
    }

    final updated = teaCollectionService.teas
        .firstWhere((item) => item.type == tea.type);

    return TeaResult(
      tea: updated,
      isNew: isNew,
    );
  }

  Widget _buildContent(BuildContext context, TeaResult result, UrlService urlService) {
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

                final result = await service.completeQuest();

                if (!context.mounted) return;
                if (result.status == QuestResultStatus.completed) {
                  showSeriesSnackBarMessage(context, result.streak, (l10n) => l10n.series);
                } else if (result.status == QuestResultStatus.alreadyDoneToday) {
                  showSeriesSnackBarMessage(context, result.streak, (l10n) => l10n.completedQuestSeries);
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