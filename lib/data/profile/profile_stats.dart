import '../stats/stats.dart';

class ProfileStats {
  final String avatarImagePath;
  final Stats stats;

  const ProfileStats({
    required this.stats,
    required this.avatarImagePath,
  });
}