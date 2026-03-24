import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/edit_shop_image_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

import '../../../core/errors/failure.dart';
import '../../entities/home_entities/home_banner_entity.dart';

abstract class HomeTransactionsRepo {
  Future<Either<Failure, void>> addBanner({required HomeBannerEntity banner});
  Future<Either<Failure, void>> addShop({required HomeShopEntity shop});
  Future<Either<Failure, String>> uploadImage({required File imageFile});
  Future<Either<Failure, List<HomeBannerEntity>>> fetchHomeBanners();
  Future<Either<Failure, List<HomeShopEntity>>> fetchHomeShops();
}

abstract class HomeDetailsTransactionsRepo {
  Future<Either<Failure, List<HomeShopProductEntity>>> fetchProducts({
    required String shopId,
  });
  Future<Either<Failure, void>> addProduct({
    required AddShopProductModelForDomain addShopProductModel,
  });
  Future<Either<Failure, void>> editProduct({
    required EditShopProductModelForDomain editShopProductModel,
  });
  Future<Either<Failure, void>> deleteProduct({
    required DeleteShopProductModelForDomain deleteShopProductModel,
  });
  Future<Either<Failure, void>> editShopInfo({required HomeShopEntity newShop});

  Future<Either<Failure, void>> editShopImage({
    required EditShopImageModel editShopImageModel,
  });

  Future<Either<Failure, void>> deleteShop({required String shopId});
}
