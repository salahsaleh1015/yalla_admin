import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class AddBannerUseCase extends UseCase<void, HomeBannerEntity> {
  HomeTransactionsRepo homeTransactionsDataRepo;

  AddBannerUseCase(this.homeTransactionsDataRepo);
  @override
  Future<Either<Failure, void>> call(HomeBannerEntity banner) async {
    return await homeTransactionsDataRepo.addBanner(banner: banner);
  }
}

class DeleteBannerUseCase extends UseCase<void, DeleteBannerModelForDomain> {
  HomeTransactionsRepo homeTransactionsDataRepo;

  DeleteBannerUseCase(this.homeTransactionsDataRepo);
  @override
  Future<Either<Failure, void>> call(DeleteBannerModelForDomain deleteModel) async {
    return await homeTransactionsDataRepo.deleteBanner(deleteBannerModel: deleteModel);
  }
}

class AddShopUseCase extends UseCase<void, HomeShopEntity> {
  HomeTransactionsRepo homeTransactionsDataRepo;

  AddShopUseCase(this.homeTransactionsDataRepo);
  @override
  Future<Either<Failure, void>> call(HomeShopEntity shop) async {
    return await homeTransactionsDataRepo.addShop(shop: shop);
  }
}

class GetBannersUseCase extends UseCase<List<HomeBannerEntity>, NoParam> {
  HomeTransactionsRepo homeBannersAndShopsRepo;

  GetBannersUseCase(this.homeBannersAndShopsRepo);
  @override
  Future<Either<Failure, List<HomeBannerEntity>>> call([NoParam? param]) async {
    return await homeBannersAndShopsRepo.fetchHomeBanners();
  }
}

class GetShopsUseCase extends UseCase<List<HomeShopEntity>, NoParam> {
  HomeTransactionsRepo homeBannersAndShopsRepo;

  GetShopsUseCase(this.homeBannersAndShopsRepo);
  @override
  Future<Either<Failure, List<HomeShopEntity>>> call([NoParam? param]) async {
    return await homeBannersAndShopsRepo.fetchHomeShops();
  }
}