


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/order_management_local_data_source/fetching_orders_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/order_management_remote_data_source/fetching_orders_remote_data_source.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/repos/order_management_repos/fetching_orders_repo.dart';

class FetchOrdersRepoImpl implements FetchingOrdersRepo{

  FetchingOrdersRemoteDataSource fetchingOrdersRemoteDataSource;
  FetchingOrdersLocalDataSource fetchingOrdersLocalDataSource;

  FetchOrdersRepoImpl(this.fetchingOrdersRemoteDataSource, this.fetchingOrdersLocalDataSource);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders() async{
    try {
      List<OrderEntity> orders;
      orders =
          fetchingOrdersLocalDataSource.fetchAcceptedOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await fetchingOrdersRemoteDataSource
          .fetchAcceptedOrders();
      print('/////////////////////////// ok ok ok ok ');
      return Right(orders);
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
  Future<Either<Failure, List<OrderEntity>>> fetchAllOrders() async{
    try {
      List<OrderEntity> orders;
      orders =
          fetchingOrdersLocalDataSource.fetchAllOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await fetchingOrdersRemoteDataSource
          .fetchAllOrders();
      print('/////////////////////////// ok ok ok ok ');
      return Right(orders);
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
  Future<Either<Failure, List<OrderEntity>>> fetchCancelledOrders() async{
    try {
      List<OrderEntity> orders;
      orders =
          fetchingOrdersLocalDataSource.fetchCanceledOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await fetchingOrdersRemoteDataSource
          .fetchCanceledOrders();
      print('/////////////////////////// ok ok ok ok ');
      return Right(orders);
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
  Future<Either<Failure, List<OrderEntity>>> fetchCompletedOrders() async{
    try {
      List<OrderEntity> orders;
      orders =
          fetchingOrdersLocalDataSource.fetchCompletedOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await fetchingOrdersRemoteDataSource
          .fetchCompletedOrders();
      print('/////////////////////////// ok ok ok ok ');
      return Right(orders);
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