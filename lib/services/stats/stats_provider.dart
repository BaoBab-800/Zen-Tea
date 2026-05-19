import 'package:flutter/foundation.dart';

import 'package:zentea/data/stats/stats.dart';

import 'i_stats_service.dart';

class StatsProvider extends ChangeNotifier {
  final IStatsService _statsService;

  StatsProvider(this._statsService);

  Future<void> updateStats(Stats stats) async {
    await _statsService.updateStats(stats);
    notifyListeners();
  }
}