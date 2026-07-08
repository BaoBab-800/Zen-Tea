// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileStatsAdapter extends TypeAdapter<ProfileStats> {
  @override
  final int typeId = 1;

  @override
  ProfileStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileStats(
      stats: fields[1] as Stats,
      avatarImagePath: fields[0] as String,
      isHisPageFound: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileStats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.avatarImagePath)
      ..writeByte(1)
      ..write(obj.stats)
      ..writeByte(2)
      ..write(obj.isHisPageFound);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
