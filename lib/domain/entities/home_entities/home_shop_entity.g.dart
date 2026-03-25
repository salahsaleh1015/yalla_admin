// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_shop_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeShopEntityAdapter extends TypeAdapter<HomeShopEntity> {
  @override
  final int typeId = 1;

  @override
  HomeShopEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeShopEntity(
      shopName: fields[0] as String,
      shopId: fields[1] as String,
      shopAddress: fields[2] as String,
      shopPhoneNumber: fields[3] as String,
      shopImage: fields[4] as String,
      shopRate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeShopEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.shopName)
      ..writeByte(1)
      ..write(obj.shopId)
      ..writeByte(2)
      ..write(obj.shopAddress)
      ..writeByte(3)
      ..write(obj.shopPhoneNumber)
      ..writeByte(4)
      ..write(obj.shopImage)
      ..writeByte(5)
      ..write(obj.shopRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeShopEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
