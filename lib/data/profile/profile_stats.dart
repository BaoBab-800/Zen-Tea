import 'package:hive/hive.dart';
import '../stats/stats.dart';

part 'profile_stats.g.dart';

@HiveType(typeId: 1)
class ProfileStats {
  @HiveField(0)
  final String avatarImagePath;

  @HiveField(1)
  final Stats stats;

  const ProfileStats({
    required this.stats,
    required this.avatarImagePath,
  });

  ProfileStats copyWith({
    String? avatarImagePath,
    Stats? stats,
  }) {
    return ProfileStats(
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      stats: stats ?? this.stats,
    );
  }
}