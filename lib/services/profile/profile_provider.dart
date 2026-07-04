import 'package:flutter/cupertino.dart';

import 'package:zentea/data/profile/profile_stats.dart';
import 'i_profile_stats_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final IProfileStatsRepository _profileStatsRepository;

  ProfileStats _profileStats;

  ProfileProvider(
      this._profileStatsRepository, {
        required ProfileStats initialProfile,
      }) : _profileStats = initialProfile;

  ProfileStats get profileStats => _profileStats;

  Future<void> updateProfileStats(ProfileStats profileStats) async {
    await _profileStatsRepository.saveProfileStats(profileStats);
    _profileStats = profileStats;
    notifyListeners();
  }
}