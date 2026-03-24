abstract class DeleteProductStates {}

final class DeleteProductInitialState extends DeleteProductStates {}
final class DeleteProductLoadingState extends DeleteProductStates {}
final class DeleteProductSuccessState extends DeleteProductStates {}
final class DeleteProductErrorState extends DeleteProductStates {
  final String errorMsg;

  DeleteProductErrorState({required this.errorMsg});
}
