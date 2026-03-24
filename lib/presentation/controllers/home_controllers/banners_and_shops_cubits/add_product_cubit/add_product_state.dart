abstract class AddProductStates {}

final class AddProductInitialState extends AddProductStates {}

final class AddProductLoadingState extends AddProductStates {}


final class AddProductSuccessState extends AddProductStates {}

final class AddProductErrorState extends AddProductStates {
  final String errorMsg;

  AddProductErrorState({required this.errorMsg});
}
