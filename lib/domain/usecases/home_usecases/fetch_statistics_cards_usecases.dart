



import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_statistics_cards_repo.dart';

class FetchNumberOfUsersCardUseCase extends UseCase<int, NoParam> {
  HomeStatisticsCardsRepo homeStatisticsCardsRepo;

  FetchNumberOfUsersCardUseCase(this.homeStatisticsCardsRepo);

  @override
  Future<Either<Failure, int>> call([NoParam? param]) async {
    return await homeStatisticsCardsRepo.fetchTheNumberOfUsers();
  }
}


class  FetchNumberOfCompletedOrdersUseCase extends UseCase<int, NoParam> {
  HomeStatisticsCardsRepo homeStatisticsCardsRepo;

  FetchNumberOfCompletedOrdersUseCase(this.homeStatisticsCardsRepo);
  @override
  Future<Either<Failure, int>> call([NoParam? param]) async {
    return await homeStatisticsCardsRepo.fetchTheNumberOfCompletedOrders();
  }
}


class FetchNumberOfDeliveriesUseCase extends UseCase<int, NoParam> {
  HomeStatisticsCardsRepo homeStatisticsCardsRepo;

  FetchNumberOfDeliveriesUseCase(this.homeStatisticsCardsRepo);
  @override
  Future<Either<Failure,int>> call([NoParam? param]) async {
    return await homeStatisticsCardsRepo.fetchTheNumberOfDeliveries();
  }
}