import 'package:hive/hive.dart';

import 'package:zentea/data/profile/profile_stats.dart';

import 'package:zentea/services/stats/i_stats_repository.dart';
import 'i_profile_stats_repository.dart';

class ProfileRepository implements IProfileStatsRepository {
  final Box<ProfileStats> _box;
  final IStatsRepository _statsRepository;

  ProfileRepository(this._box, this._statsRepository);

  static const _profileStatsKey = 'profile_stats_key';

  @override
  Future<ProfileStats> getProfileStats() async {
    final profile = _box.get(_profileStatsKey);

    if (profile == null) {
      final initialProfile = ProfileStats(
        avatarImagePath: 'assets/teas/default_tea_avatar.jpg',
        stats: await _statsRepository.getStats(),
        isHisPageFound: false,
      );

      await _box.put(_profileStatsKey, initialProfile);
      return initialProfile;
    }

    return profile;
  }

  @override
  Future<void> saveProfileStats(ProfileStats profileStats) async {
    await _box.put(_profileStatsKey, profileStats);
  }
}