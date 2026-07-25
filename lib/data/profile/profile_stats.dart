import 'package:hive/hive.dart';
import '../stats/stats.dart';

part 'profile_stats.g.dart';

@HiveType(typeId: 1)
class ProfileStats {
  @HiveField(0)
  final String avatarImagePath;

  @HiveField(1)
  final Stats stats;

  @HiveField(2, defaultValue: false)
  final bool isHisPageFound;

  const ProfileStats({
    required this.stats,
    required this.avatarImagePath,
    required this.isHisPageFound,
  });

  ProfileStats copyWith({
    String? avatarImagePath,
    Stats? stats,
    bool? isHisPageFound,
  }) {
    return ProfileStats(
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      stats: stats ?? this.stats,
      isHisPageFound: isHisPageFound ?? this.isHisPageFound,
    );
  }
}