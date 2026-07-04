import 'package:zentea/data/profile/profile_stats.dart';

abstract class IProfileStatsRepository {
  Future<ProfileStats> getProfileStats();
  Future<void> saveProfileStats(ProfileStats profileStats);
}