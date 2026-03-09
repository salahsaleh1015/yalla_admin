import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchingOrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchAllOrders();
  Future<Either<Failure, List<OrderEntity>>> fetchCompletedOrders();
  Future<Either<Failure, List<OrderEntity>>> fetchCancelledOrders();
  Future<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders();
}
