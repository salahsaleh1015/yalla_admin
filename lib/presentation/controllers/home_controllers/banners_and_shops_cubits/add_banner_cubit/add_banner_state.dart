abstract class AddBannerStates {}

final class AddBannerInitialState extends AddBannerStates {}


final class AddBannerSuccessState extends AddBannerStates {}


final class AddBannerLoadingState extends AddBannerStates {}


final class AddBannerErrorState extends AddBannerStates {
  final String errorMsg;

  AddBannerErrorState({required this.errorMsg});
}


