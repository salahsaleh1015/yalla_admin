


import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchCompletedOrdersStates {}

final class FetchCompletedOrdersInitialState extends FetchCompletedOrdersStates {}
final class FetchCompletedOrdersLoadingState extends FetchCompletedOrdersStates {}
final class FetchCompletedOrdersSuccessState extends FetchCompletedOrdersStates {
  final List<OrderEntity> completedOrders;

  FetchCompletedOrdersSuccessState({required this.completedOrders});
}
final class FetchCompletedOrdersErrorState extends FetchCompletedOrdersStates {

  final String errorMsg;

  FetchCompletedOrdersErrorState({required this.errorMsg});
}
