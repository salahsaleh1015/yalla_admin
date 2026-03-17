// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeBannerEntityAdapter extends TypeAdapter<HomeBannerEntity> {
  @override
  final int typeId = 0;

  @override
  HomeBannerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeBannerEntity(
      bannerImage: fields[0] as String,
      bannerShopName: fields[1] as String,
      bannerId: fields[4] as String,
      bannerShopAddress: fields[2] as String,
      bannerShopPhoneNumber: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeBannerEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bannerImage)
      ..writeByte(1)
      ..write(obj.bannerShopName)
      ..writeByte(2)
      ..write(obj.bannerShopAddress)
      ..writeByte(3)
      ..write(obj.bannerShopPhoneNumber)
      ..writeByte(4)
      ..write(obj.bannerId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeBannerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
