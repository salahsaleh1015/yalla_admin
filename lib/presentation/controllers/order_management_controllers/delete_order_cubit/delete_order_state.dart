


abstract class DeleteOrderStates {}

final class DeleteOrderInitialState extends DeleteOrderStates {}
final class DeleteOrderLoadingState extends DeleteOrderStates {}
final class DeleteOrderSuccessState extends DeleteOrderStates {}
final class DeleteOrderErrorState extends DeleteOrderStates {

  final String errorMsg;

  DeleteOrderErrorState({required this.errorMsg});
}
