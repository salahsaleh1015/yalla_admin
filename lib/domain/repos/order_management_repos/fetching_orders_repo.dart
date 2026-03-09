import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchingOrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> FetchAllOrders();
  Future<Either<Failure, List<OrderEntity>>> FetchCompletedOrders({
    required String orderStatus,
  });
  Future<Either<Failure, List<OrderEntity>>> FetchCancelledOrders({
    required String orderStatus,
  });
  Future<Either<Failure, List<OrderEntity>>> FetchAcceptedOrders({
    required String orderStatus,
  });
}
