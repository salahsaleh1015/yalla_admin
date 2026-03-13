import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/delivery_management_local_data_source/fetching_deliveries_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/delivery_management_remote_data_source/fetching_deliveries_remote_data_source.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/fetching_deliveries_repo.dart';

class FetchingDeliveriesRepoImpl implements FetchingDeliveriesRepo {
  FetchingDeliveriesRemoteDataSource fetchingDeliveriesRemoteDataSource;
  FetchingDeliveriesLocalDataSource fetchingDeliveriesLocalDataSource;
  FetchingDeliveriesRepoImpl(
    this.fetchingDeliveriesRemoteDataSource,
    this.fetchingDeliveriesLocalDataSource,
  );
  @override
  Future<Either<Failure, List<DeliveryEntity>>> fetchAvailableDeliveries()async {
    try {
      List<DeliveryEntity> availableDeliveries;
      availableDeliveries = fetchingDeliveriesLocalDataSource.fetchAvailableDeliveries();
      if (availableDeliveries.isNotEmpty) {
        return Right(availableDeliveries);
      }
      availableDeliveries = await fetchingDeliveriesRemoteDataSource.fetchAvailableDeliveries();
      debugPrint(" the availableDeliveries from the internet");
      return Right(availableDeliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryEntity>>> fetchBusyDeliveries() async{
    try {
      List<DeliveryEntity> busyDeliveries;
      busyDeliveries = fetchingDeliveriesLocalDataSource.fetchBusyDeliveries();
      if (busyDeliveries.isNotEmpty) {
        return Right(busyDeliveries);
      }
      busyDeliveries = await fetchingDeliveriesRemoteDataSource.fetchBusyDeliveries();
      debugPrint(" the busyDeliveries from the internet");
      return Right(busyDeliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryEntity>>> fetchUnAvailableOrders()async {
    try {
      List<DeliveryEntity> unAvailableDeliveries;
      unAvailableDeliveries = fetchingDeliveriesLocalDataSource.fetchUnAvailableDeliveries();
      if (unAvailableDeliveries.isNotEmpty) {
        return Right(unAvailableDeliveries);
      }
      unAvailableDeliveries = await fetchingDeliveriesRemoteDataSource.fetchUnAvailableDeliveries();
      debugPrint(" the unAvailableDeliveries from the internet");
      return Right(unAvailableDeliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
