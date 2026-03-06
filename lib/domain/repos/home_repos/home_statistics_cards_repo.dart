
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';

abstract class HomeStatisticsCardsRepo{
  Future<Either<Failure, int>> getTheNumberOfDeliveries();
  Future<Either<Failure, int>> getTheNumberOfCompletedOrders();
  Future<Either<Failure, int>> getTheNumberOfUsers();

}