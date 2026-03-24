abstract class EditProductStates {}

final class EditProductInitialState extends EditProductStates {}

final class EditProductLoadingState extends EditProductStates {}

final class EditProductSuccessState extends EditProductStates {}

final class EditProductErrorState extends EditProductStates {
  final String errorMsg;

  EditProductErrorState({required this.errorMsg});
}
