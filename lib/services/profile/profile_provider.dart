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

  Future<void> updateAvatar(String avatarImagePath) async {
    final newProfile = _profileStats.copyWith(avatarImagePath: avatarImagePath);
    await _profileStatsRepository.saveProfileStats(newProfile);
    _profileStats = newProfile;
    notifyListeners();
  }

  Future<void> updateHisPageFlag(bool newFlagState) async {
    final newProfile = _profileStats.copyWith(isHisPageFound: newFlagState);
    await _profileStatsRepository.saveProfileStats(newProfile);
    _profileStats = newProfile;
    notifyListeners();
  }

  Future<void> updateDeveloperRoomFlag(bool newFlagState) async {
    final newProfile = _profileStats.copyWith(isDeveloperRoomFound: newFlagState);
    await _profileStatsRepository.saveProfileStats(newProfile);
    _profileStats = newProfile;
    notifyListeners();
  }
}