abstract class AddShopsStates {}

final class AddShopInitialState extends AddShopsStates {}


final class AddShopSuccessState extends AddShopsStates {}


final class AddShopLoadingState extends AddShopsStates {}


final class AddShopErrorState extends AddShopsStates {
  final String errorMsg;

  AddShopErrorState({required this.errorMsg});
}


