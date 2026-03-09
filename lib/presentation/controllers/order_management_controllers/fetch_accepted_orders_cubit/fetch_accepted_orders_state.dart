import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchAcceptedOrdersStates {}

final class FetchAcceptedOrdersInitialState extends FetchAcceptedOrdersStates {}

final class FetchAcceptedOrdersLoadingState extends FetchAcceptedOrdersStates {}

final class FetchAcceptedOrdersSuccessState extends FetchAcceptedOrdersStates {
 final List<OrderEntity> acceptedOrders;

  FetchAcceptedOrdersSuccessState({required this.acceptedOrders});
}

final class FetchAcceptedOrdersErrorState extends FetchAcceptedOrdersStates {
  final String errorMsg;

  FetchAcceptedOrdersErrorState({required this.errorMsg});
}
