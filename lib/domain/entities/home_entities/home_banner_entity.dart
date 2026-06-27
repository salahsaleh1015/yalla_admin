import 'package:hive_flutter/hive_flutter.dart';

part 'home_banner_entity.g.dart';

@HiveType(typeId: 0)
class HomeBannerEntity {
  @HiveField(0)
  final String bannerImage;
  @HiveField(1)
  final String bannerLanguage;
  @HiveField(2)
  final String bannerId;

  HomeBannerEntity(
      {required this.bannerImage,
        required this.bannerLanguage,
        required this.bannerId});
}