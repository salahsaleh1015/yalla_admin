// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 2;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      userName: fields[0] as String,
      orderId: fields[8] as String,
      userLocation: fields[1] as String,
      userPhone: fields[2] as String,
      deliveryName: fields[3] as String,
      orderDetails: fields[4] as String,
      orderStatus: fields[5] as String,
      orderRequestTime: fields[6] as String,
      orderNotes: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.userLocation)
      ..writeByte(2)
      ..write(obj.userPhone)
      ..writeByte(3)
      ..write(obj.deliveryName)
      ..writeByte(4)
      ..write(obj.orderDetails)
      ..writeByte(5)
      ..write(obj.orderStatus)
      ..writeByte(6)
      ..write(obj.orderRequestTime)
      ..writeByte(7)
      ..write(obj.orderNotes)
      ..writeByte(8)
      ..write(obj.orderId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
