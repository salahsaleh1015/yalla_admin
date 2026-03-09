import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchCancelledOrdersStates {}

final class FetchCancelledOrdersInitialState extends FetchCancelledOrdersStates{}

final class FetchCancelledOrdersLoadingState extends FetchCancelledOrdersStates{}

final class FetchCancelledOrdersSuccessState extends FetchCancelledOrdersStates{
  final List<OrderEntity> cancelledOrders;

  FetchCancelledOrdersSuccessState({required this.cancelledOrders});
}

final class FetchCancelledOrdersErrorState extends FetchCancelledOrdersStates{

  final String errorMsg;

  FetchCancelledOrdersErrorState({required this.errorMsg});
}
