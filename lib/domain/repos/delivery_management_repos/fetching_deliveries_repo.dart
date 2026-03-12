import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchingDeliveriesRepo {
  Future<Either<Failure, List<DeliveryEntity>>> fetchAvailableDeliveries();

  Future<Either<Failure, List<DeliveryEntity>>> fetchBusyDeliveries();

  Future<Either<Failure, List<DeliveryEntity>>> fetchUnAvailableOrders();
}
