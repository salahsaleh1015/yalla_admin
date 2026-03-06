// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_number_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersNumberEntityAdapter extends TypeAdapter<UsersNumberEntity> {
  @override
  final int typeId = 2;

  @override
  UsersNumberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersNumberEntity(
      usersNumber: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UsersNumberEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.usersNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersNumberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
