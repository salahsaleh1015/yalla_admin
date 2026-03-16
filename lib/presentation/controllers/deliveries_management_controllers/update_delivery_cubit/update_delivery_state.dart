abstract class UpdateDeliveryStates {}

final class UpdateDeliveryInitialState extends UpdateDeliveryStates {}
final class UpdateDeliveryLoadingState extends UpdateDeliveryStates {}
final class UpdateDeliverySuccessState extends UpdateDeliveryStates {}
final class UpdateDeliveryErrorState extends UpdateDeliveryStates {
  final String errorMsg;

  UpdateDeliveryErrorState({required this.errorMsg});
}
