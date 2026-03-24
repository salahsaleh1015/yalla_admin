
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';

abstract class HomeStatisticsCardsRepo{
  Future<Either<Failure, int>> fetchTheNumberOfDeliveries();
  Future<Either<Failure, int>> fetchTheNumberOfCompletedOrders();
  Future<Either<Failure, int>> fetchTheNumberOfUsers();

}