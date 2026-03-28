abstract class DeleteBannerStates {}

final class DeleteBannerInitialState extends DeleteBannerStates {}

final class DeleteBannerLoadingState extends DeleteBannerStates {}

final class DeleteBannerSuccessState extends DeleteBannerStates {}

final class DeleteBannerErrorState extends DeleteBannerStates {
  final String errorMsg;

  DeleteBannerErrorState({required this.errorMsg});

}

