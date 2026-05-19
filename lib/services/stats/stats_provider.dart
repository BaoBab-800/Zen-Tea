import 'package:flutter/foundation.dart';

import 'package:zentea/data/stats/stats.dart';

import 'stats_service.dart';

class StatsProvider extends ChangeNotifier {
  final StatsService _statsService;

  StatsProvider(this._statsService);

  Future<void> updateStats(Stats stats) async {
    await _statsService.updateStats(stats);
    notifyListeners();
  }
}