


import 'package:dartz/dartz.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';

import '../../../core/errors/failure.dart';
import '../../entities/home_entities/home_banner_entity.dart';

abstract class HomeBannersAndShopsRepo {
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners();

  Future<Either<Failure, List<HomeShopEntity>>> getHomeShops();
}