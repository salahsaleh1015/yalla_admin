import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class GetBannersUseCase extends UseCase<List<HomeBannerEntity>, NoParam> {
  HomeBannersAndShopsRepo homeBannersAndShopsRepo;

  GetBannersUseCase(this.homeBannersAndShopsRepo);
  @override
  Future<Either<Failure, List<HomeBannerEntity>>> call([NoParam? param]) async {
    return await homeBannersAndShopsRepo.getHomeBanners();
  }
}