abstract class DeleteShopStates {}

final class DeleteShopInitialState extends DeleteShopStates {}

final class DeleteShopLoadingState extends DeleteShopStates {}

final class DeleteShopSuccessState extends DeleteShopStates {}

final class DeleteShopErrorState extends DeleteShopStates {
  final String errorMsg;

  DeleteShopErrorState({required this.errorMsg});
}
