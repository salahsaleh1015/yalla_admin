import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/home_local_data_sources/home_statistics_cards_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_statistics_cards_remote_data_source.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_statistics_cards_repo.dart';

class HomeStatisticsCardsRepoImpl implements HomeStatisticsCardsRepo {
  final HomeStatisticsCardsLocalDataSource homeStatisticsCardsLocalDataSource;
  final HomeStatisticsCardsRemoteDataSource homeStatisticsCardsRemoteDataSource;

  HomeStatisticsCardsRepoImpl({
    required this.homeStatisticsCardsRemoteDataSource,
    required this.homeStatisticsCardsLocalDataSource,
  });

  @override
  Future<Either<Failure, int>> fetchTheNumberOfCompletedOrders() async {
    try {
      // نحاول نجيب الرقم من الـ local data source
      int completedOrders =
          homeStatisticsCardsLocalDataSource.getTheNumberOfCompletedOrders();

      // لو الرقم غير موجود أو 0، نجرب نحصل عليه من الـ remote
      if (completedOrders == 0) {
        completedOrders =
            await homeStatisticsCardsRemoteDataSource
                .getTheNumberOfCompletedOrders();

        debugPrint("ابه الكلام يا نجوميا 3");
      }

      // رجع الرقم كـ Right
      return Right(completedOrders);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("ابه الكلام يا نجوميا 1");
        debugPrint(e.toString());
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("2ابه الكلام يا نجوميا ");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> fetchTheNumberOfDeliveries() async {
    try {
      // نحاول نجيب الرقم من الـ local data source
      int deliveries =
          homeStatisticsCardsLocalDataSource.getTheNumberOfDeliveries();

      // لو الرقم غير موجود أو 0، نجرب نحصل عليه من الـ remote
      if (deliveries == 0) {
        deliveries =
            await homeStatisticsCardsRemoteDataSource
                .getTheNumberOfDeliveries();

        debugPrint("ابه الكلام يا نجوميا 3");
      }

      // رجع الرقم كـ Right
      return Right(deliveries);
    } catch (e) {
      debugPrint("/////////////////// this is data layer repo");
      debugPrint(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> fetchTheNumberOfUsers() async {
    try {
      // نحاول نجيب الرقم من الـ local data source
      int users =
      homeStatisticsCardsLocalDataSource.getTheNumberOfUsers();

      // لو الرقم غير موجود أو 0، نجرب نحصل عليه من الـ remote
      if (users == 0) {
        users =
        await homeStatisticsCardsRemoteDataSource
            .getTheNumberOfUsers();

        debugPrint("ابه الكلام يا نجوميا 3");
      }

      // رجع الرقم كـ Right
      return Right(users);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
