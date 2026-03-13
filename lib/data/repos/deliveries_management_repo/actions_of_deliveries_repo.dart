import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/delivery_management_remote_data_source/actions_of_deliveries_remote_data_source.dart';
import 'package:yalla_admin/data/models/delivery_model.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/actions_of_deliveries_repo.dart';

class ActionsOfDeliveriesRepoImpl implements ActionsOfDeliveriesRepo {
  ActionsOfDeliveriesRemoteDataSource actionsOfDeliveriesRemoteDataSource;

  ActionsOfDeliveriesRepoImpl(this.actionsOfDeliveriesRemoteDataSource);

  @override
  Future<Either<Failure, void>> addDelivery({
    required DeliveryEntity delivery,
  }) async {
    try {
      final deliveryModel = DeliveryModel.fromEntity(delivery);

      await actionsOfDeliveriesRemoteDataSource.addDelivery(
        deliveryModel: deliveryModel,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDelivery({
    required String deliveryId,
  }) async {
    try {
      await actionsOfDeliveriesRemoteDataSource.deleteDelivery(
        deliveryId: deliveryId,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDelivery({
    required DeliveryEntity delivery,
  }) async {
    try {
      final deliveryModel = DeliveryModel.fromEntity(delivery);
      await actionsOfDeliveriesRemoteDataSource.updateDelivery(
        deliveryModel: deliveryModel,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
