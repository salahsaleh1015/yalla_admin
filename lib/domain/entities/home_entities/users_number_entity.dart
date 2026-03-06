import 'package:hive_flutter/hive_flutter.dart';

part 'users_number_entity.g.dart';

@HiveType(typeId: 2)
class UsersNumberEntity {
  @HiveField(0)
  final int usersNumber;

  UsersNumberEntity({required this.usersNumber});
}
