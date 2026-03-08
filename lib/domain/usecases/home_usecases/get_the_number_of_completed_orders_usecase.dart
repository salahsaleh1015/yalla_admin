




import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_statistics_cards_repo.dart';

class GetTheNumberOfCompletedOrdersUseCase extends UseCase<int, NoParam> {
  HomeStatisticsCardsRepo homeStatisticsCardsRepo;

  GetTheNumberOfCompletedOrdersUseCase(this.homeStatisticsCardsRepo);
  @override
  Future<Either<Failure, int>> call([NoParam? param]) async {
    return await homeStatisticsCardsRepo.getTheNumberOfCompletedOrders();
  }
}