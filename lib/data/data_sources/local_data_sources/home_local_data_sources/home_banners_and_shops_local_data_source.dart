



import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';

abstract class HomeBannersAndShopsLocalDataSource {
  List<HomeBannerEntity> getHomeBanners();
  List<HomeShopEntity> getHomeShops();


}

class HomeBannersAndShopsLocalDataSourceImpl implements HomeBannersAndShopsLocalDataSource {
  @override
  List<HomeBannerEntity> getHomeBanners() {
    var box = Hive.box<HomeBannerEntity>(HiveServices.kBannersBox);
    return box.values.toList();
  }

  @override
  List<HomeShopEntity> getHomeShops() {
    var box = Hive.box<HomeShopEntity>(HiveServices.kShopsBox);
    return box.values.toList();
  }

}