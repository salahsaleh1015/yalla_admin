import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

import '../../../core/errors/failure.dart';
import '../../entities/home_entities/home_banner_entity.dart';

abstract class HomeBannersAndShopsRepo {
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners();
  Future<Either<Failure, List<HomeShopEntity>>> getHomeShops();
  Future<Either<Failure, List<HomeShopProductEntity>>> getHomeShopProducts({
    required String shopId,
  });
}

abstract class AddHomeDataRepo {
  Future<Either<Failure, void>> addBanner({required HomeBannerEntity banner});
  Future<Either<Failure, void>> addShop({required HomeShopEntity shop});
  Future<Either<Failure, String>> uploadImage({required File imageFile});
  Future<Either<Failure, void>> addShopProduct({required AddShopProductModel addShopProductModel,});
  Future<Either<Failure, void>> editShopProduct({required EditShopProductModel editShopProductModel,});
  Future<Either<Failure, void>> deleteShopProduct({required DeleteShopProductModel deleteShopProductModel,});
}
