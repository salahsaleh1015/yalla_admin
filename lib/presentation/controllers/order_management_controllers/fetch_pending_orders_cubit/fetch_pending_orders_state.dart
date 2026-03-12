


import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchPendingOrdersStates {}

final class FetchPendingOrdersInitialState extends FetchPendingOrdersStates {}

final class FetchPendingOrdersLoadingState extends FetchPendingOrdersStates {}

final class FetchPendingOrdersSuccessState extends FetchPendingOrdersStates {
  final List<OrderEntity> allOrders;

  FetchPendingOrdersSuccessState({required this.allOrders});


}


final class FetchPendingOrdersErrorState extends FetchPendingOrdersStates {
  final String errorMsg;

  FetchPendingOrdersErrorState({required this.errorMsg});
}
