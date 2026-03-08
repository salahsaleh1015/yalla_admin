


import 'package:hive/hive.dart';

part 'home_shop_entity.g.dart';

@HiveType(typeId: 1)
class HomeShopEntity {
  @HiveField(0)
  final String shopName;
  @HiveField(1)
  final String shopId;
  @HiveField(2)
  final String shopAddress;
  @HiveField(3)
  final String shopPhoneNumber;
  @HiveField(4)
  final String shopImage;
  @HiveField(5)
  final num shopRate;

  HomeShopEntity({
    required this.shopName,
    required this.shopId,
    required this.shopAddress,
    required this.shopPhoneNumber,
    required this.shopImage,
    required this.shopRate,
  });
}