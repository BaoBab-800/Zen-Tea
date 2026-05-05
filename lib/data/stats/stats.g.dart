// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatsAdapter extends TypeAdapter<Stats> {
  @override
  final int typeId = 0;

  @override
  Stats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stats(
      totalServed: fields[0] as int,
      uniqueTeas: fields[1] as int,
      streakDays: fields[2] as int,
      currentTeaServed: fields[3] as int,
      rareTeasObtained: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Stats obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.totalServed)
      ..writeByte(1)
      ..write(obj.uniqueTeas)
      ..writeByte(2)
      ..write(obj.streakDays)
      ..writeByte(3)
      ..write(obj.currentTeaServed)
      ..writeByte(4)
      ..write(obj.rareTeasObtained);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
