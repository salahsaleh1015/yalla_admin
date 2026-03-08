

abstract class GetTheNumberOfCompletedOrdersStates {}

final class GetTheNumberOfCompletedOrdersInitialState
    extends GetTheNumberOfCompletedOrdersStates {}

final class GetTheNumberOfCompletedOrdersLoadingState
    extends GetTheNumberOfCompletedOrdersStates {}

final class GetTheNumberOfCompletedOrdersSuccessState
    extends GetTheNumberOfCompletedOrdersStates {
  final int ordersNumber;

  GetTheNumberOfCompletedOrdersSuccessState({required this.ordersNumber});
}

final class GetTheNumberOfCompletedOrdersErrorState
    extends GetTheNumberOfCompletedOrdersStates {
  final String errorMsg;

  GetTheNumberOfCompletedOrdersErrorState({required this.errorMsg});
}
