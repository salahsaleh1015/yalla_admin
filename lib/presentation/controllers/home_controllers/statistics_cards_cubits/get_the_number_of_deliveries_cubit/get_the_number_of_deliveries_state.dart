


abstract class GetTheNumberOfDeliveriesStates {}

final class GetTheNumberOfDeliveriesInitialState extends GetTheNumberOfDeliveriesStates {}
final class GetTheNumberOfDeliveriesLoadingState extends GetTheNumberOfDeliveriesStates {}
final class GetTheNumberOfDeliveriesSuccessState extends GetTheNumberOfDeliveriesStates {
  final int deliveriesNumber;

  GetTheNumberOfDeliveriesSuccessState({required this.deliveriesNumber});
}
final class GetTheNumberOfDeliveriesErrorState extends GetTheNumberOfDeliveriesStates {
  final String errorMessage;

  GetTheNumberOfDeliveriesErrorState({required this.errorMessage});
}
