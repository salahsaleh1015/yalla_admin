abstract class EditShopInfoStates {}

final class EditShopInfoInitialState extends EditShopInfoStates {}

final class EditShopInfoLoadingState extends EditShopInfoStates {}

final class EditShopInfoSuccessState extends EditShopInfoStates {}

final class EditShopInfoErrorState extends EditShopInfoStates {
  final String errorMsg;

  EditShopInfoErrorState({required this.errorMsg});
}
