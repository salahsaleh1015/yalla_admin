import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
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
  Future<Either<Failure, int>> getTheNumberOfCompletedOrders() async {
    try {
      int completedOrders;
      completedOrders =
          homeStatisticsCardsLocalDataSource.getTheNumberOfCompletedOrders();
      if (completedOrders.isNaN) {
        return Right(completedOrders);
      }
      completedOrders =
          await homeStatisticsCardsRemoteDataSource
              .getTheNumberOfCompletedOrders();
      return Right(completedOrders);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTheNumberOfDeliveries() async {
    try {
      int deliveries;
      deliveries =
          homeStatisticsCardsLocalDataSource.getTheNumberOfDeliveries();
      if (deliveries.isNaN) {
        return Right(deliveries);
      }
      deliveries =
          await homeStatisticsCardsRemoteDataSource.getTheNumberOfDeliveries();
      return Right(deliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTheNumberOfUsers() async {
    try {
      int users;
      users = homeStatisticsCardsLocalDataSource.getTheNumberOfUsers();
      if (users.isNaN) {
        return Right(users);
      }
      users = await homeStatisticsCardsRemoteDataSource.getTheNumberOfUsers();
      return Right(users);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
