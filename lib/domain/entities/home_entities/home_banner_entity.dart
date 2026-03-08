import 'package:hive_flutter/hive_flutter.dart';

part 'home_banner_entity.g.dart';

@HiveType(typeId: 0)
class HomeBannerEntity {

  @HiveField(0)
  final String bannerImage;
  @HiveField(1)
  final String bannerShopName;
  @HiveField(2)
  final String   bannerShopAddress;
  @HiveField(3)
  final String  bannerShopPhoneNumber;

  HomeBannerEntity(
      {required this.bannerImage,
        required this.bannerShopName,
        required this.bannerShopAddress,
        required this.bannerShopPhoneNumber});
}