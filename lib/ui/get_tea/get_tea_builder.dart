import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/data/teas/tea_result.dart';
import 'package:zentea/services/achievements/i_achievement_notification_service.dart';
import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/get_tea/get_tea_flow_controller.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/services/today_tea/i_today_tea_service.dart';
import 'package:zentea/services/url/url_service.dart';
import 'package:zentea/services/welcome_dialog/i_welcome_dialog_service.dart';
import 'package:zentea/ui/get_tea/widgets/achievement_notifications.dart';
import 'package:zentea/ui/get_tea/widgets/tea_content.dart';
import 'package:zentea/ui/get_tea/widgets/welcome_dialog.dart';

import 'package:zentea/core/l10n/l10n.dart';

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

    _future = _controller
        .getTodayTea(
          todayTeaService: context.read<ITodayTeaService>(),
          teaCollectionService: context.read<ITeaCollectionService>(),
        )
        .then((result) async {
      if (!mounted) return result;

      await _processTeaReceived(result);
      return result;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_showWelcomeDialogIfNeeded());
    });
  }

  Future<void> _showWelcomeDialogIfNeeded() async {
    final shouldShow = await context
        .read<IWelcomeDialogService>()
        .consumeWelcomeDialogIfNeeded();

    if (!mounted || !shouldShow) return;

    unawaited(WelcomeDialog.show(context));
  }

  Future<void> _processTeaReceived(TeaResult result) async {
    if (_isTeaReceivedProcessed) return;
    _isTeaReceivedProcessed = true;

    final unlockResult = await _controller.processTeaReceived(
      statsProvider: context.read<StatsProvider>(),
      achievementsService: context.read<IAchievementsService>(),
      tea: result.tea,
      isNew: result.isNew,
      shouldCountServing: result.shouldCountServing,
    );

    final achievementToShow = await context
        .read<IAchievementNotificationService>()
        .takeFirstUnshown(
          previouslyUnlocked: unlockResult.previouslyUnlocked,
          newlyUnlocked: unlockResult.newlyUnlocked,
        );

    if (!mounted || achievementToShow == null) return;

    AchievementNotifications.showUnlocked(
      context: context,
      achievement: _controller.getAchievementById(achievementToShow),
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
              unawaited(WelcomeDialog.show(context));
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

          return TeaContent(
            result: snapshot.data!,
            urlService: widget.urlService,
            controller: _controller,
          );
        },
      ),
    );
  }
}
