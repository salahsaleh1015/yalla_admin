


import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchAllOrdersStates {}

final class FetchAllOrdersInitialState extends FetchAllOrdersStates {}

final class FetchAllOrdersLoadingState extends FetchAllOrdersStates {}

final class FetchAllOrdersSuccessState extends FetchAllOrdersStates {
  final List<OrderEntity> allOrders;

  FetchAllOrdersSuccessState({required this.allOrders});


}


final class FetchAllOrdersErrorState extends FetchAllOrdersStates {
  final String errorMsg;

  FetchAllOrdersErrorState({required this.errorMsg});
}
