abstract class DeleteDeliveryStates {}

final class DeleteDeliveryInitialState extends DeleteDeliveryStates {}

final class DeleteDeliveryLoadingState extends DeleteDeliveryStates {}

final class DeleteDeliverySuccessState extends DeleteDeliveryStates {}

final class DeleteDeliveryErrorState extends DeleteDeliveryStates {
  final String errorMsg;

  DeleteDeliveryErrorState({required this.errorMsg});
}
