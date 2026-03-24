abstract class EditShopImageStates {}

final class EditShopImageInitialState extends EditShopImageStates {}

final class EditShopImageLoadingState extends EditShopImageStates {}

final class EditShopImageSuccessState extends EditShopImageStates {}

final class EditShopImageErrorState extends EditShopImageStates {
  final String errorMsg;

  EditShopImageErrorState({required this.errorMsg});
}
