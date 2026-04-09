// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProblemEntityAdapter extends TypeAdapter<ProblemEntity> {
  @override
  final int typeId = 5;

  @override
  ProblemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProblemEntity(
      problemId: fields[0] as String,
      problemTitle: fields[1] as String,
      problemDetails: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProblemEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.problemId)
      ..writeByte(1)
      ..write(obj.problemTitle)
      ..writeByte(2)
      ..write(obj.problemDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProblemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
