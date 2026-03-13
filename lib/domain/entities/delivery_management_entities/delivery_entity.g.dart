// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryEntityAdapter extends TypeAdapter<DeliveryEntity> {
  @override
  final int typeId = 3;

  @override
  DeliveryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryEntity(
      deliveryId: fields[0] as String,
      deliveryLocation: fields[1] as String,
      deliveryName: fields[2] as String,
      deliveryPhone: fields[3] as String,
      deliveryRate: fields[4] as num,
      deliveryStatus: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.deliveryId)
      ..writeByte(1)
      ..write(obj.deliveryLocation)
      ..writeByte(2)
      ..write(obj.deliveryName)
      ..writeByte(3)
      ..write(obj.deliveryPhone)
      ..writeByte(4)
      ..write(obj.deliveryRate)
      ..writeByte(5)
      ..write(obj.deliveryStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
