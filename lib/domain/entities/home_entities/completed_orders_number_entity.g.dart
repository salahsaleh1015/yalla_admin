// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_orders_number_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedOrdersNumberEntityAdapter
    extends TypeAdapter<CompletedOrdersNumberEntity> {
  @override
  final int typeId = 1;

  @override
  CompletedOrdersNumberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedOrdersNumberEntity(
      completedOrdersNumber: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedOrdersNumberEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.completedOrdersNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedOrdersNumberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
