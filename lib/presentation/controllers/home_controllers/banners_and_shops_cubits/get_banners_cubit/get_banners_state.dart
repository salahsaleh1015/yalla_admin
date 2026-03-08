import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';

abstract class GetBannersStates {}

final class GetBannersInitialState extends GetBannersStates {}

final class GetBannersLoadedState extends GetBannersStates {
  final List<HomeBannerEntity> bannersList;
  GetBannersLoadedState({required this.bannersList});
}

final class GetBannersErrorState extends GetBannersStates {
  final String errorMessage;
  GetBannersErrorState({required this.errorMessage});
}

final class GetBannersLoadingState extends GetBannersStates {}