abstract class AddDeliveryStates {}

final class AddDeliveryInitialState extends AddDeliveryStates {}
final class AddDeliveryLoadingState extends AddDeliveryStates {}
final class AddDeliverySuccessState extends AddDeliveryStates {}
final class AddDeliveryErrorState extends AddDeliveryStates {
  final String errorMsg;

  AddDeliveryErrorState({required this.errorMsg});
}
