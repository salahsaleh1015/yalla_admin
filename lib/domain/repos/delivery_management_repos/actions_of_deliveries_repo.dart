import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/models/delete_delivery_model.dart';
import 'package:yalla_admin/data/models/delivery_model.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class ActionsOfDeliveriesRepo {
  Future<Either<Failure, void>> addDelivery({required DeliveryEntity delivery});

  Future<Either<Failure, void>> deleteDelivery({
    required String deliveryId,
  });

  Future<Either<Failure, void>> updateDelivery({required DeliveryEntity delivery});
}
