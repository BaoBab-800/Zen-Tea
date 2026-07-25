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

  @HiveField(3, defaultValue: false)
  final bool isDeveloperRoomFound;

  const ProfileStats({
    required this.stats,
    required this.avatarImagePath,
    required this.isHisPageFound,
    required this.isDeveloperRoomFound,
  });

  ProfileStats copyWith({
    String? avatarImagePath,
    Stats? stats,
    bool? isHisPageFound,
    bool? isDeveloperRoomFound,
  }) {
    return ProfileStats(
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      stats: stats ?? this.stats,
      isHisPageFound: isHisPageFound ?? this.isHisPageFound,
      isDeveloperRoomFound: isDeveloperRoomFound ?? this.isDeveloperRoomFound,
    );
  }
}