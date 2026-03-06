// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveries_number_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveriesNumberEntityAdapter
    extends TypeAdapter<DeliveriesNumberEntity> {
  @override
  final int typeId = 0;

  @override
  DeliveriesNumberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveriesNumberEntity(
      deliveriesNumber: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveriesNumberEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deliveriesNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveriesNumberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
