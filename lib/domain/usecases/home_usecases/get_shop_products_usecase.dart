import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class GetShopProductsUseCase
    extends UseCase<List<HomeShopProductEntity>, String> {
  HomeBannersAndShopsRepo homeBannersAndShopsRepo;

  GetShopProductsUseCase(this.homeBannersAndShopsRepo);
  @override
  Future<Either<Failure, List<HomeShopProductEntity>>> call(
    String shopId,
  ) async {
    return await homeBannersAndShopsRepo.getHomeShopProducts(shopId: shopId);
  }
}
