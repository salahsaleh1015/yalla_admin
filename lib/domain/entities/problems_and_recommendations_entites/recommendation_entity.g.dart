// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecommendationEntityAdapter extends TypeAdapter<RecommendationEntity> {
  @override
  final int typeId = 4;

  @override
  RecommendationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecommendationEntity(
      recommendationId: fields[0] as String,
      recommendationTitle: fields[1] as String,
      recommendationDetails: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecommendationEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.recommendationId)
      ..writeByte(1)
      ..write(obj.recommendationTitle)
      ..writeByte(2)
      ..write(obj.recommendationDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
