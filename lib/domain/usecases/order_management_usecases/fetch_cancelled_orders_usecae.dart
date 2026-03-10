




import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/repos/order_management_repos/fetching_orders_repo.dart';

class FetchCancelledOrdersUseCase
    extends UseCase<List<OrderEntity>, NoParam> {

  FetchingOrdersRepo fetchingOrdersRepo;
  FetchCancelledOrdersUseCase(this.fetchingOrdersRepo);

  @override
  Future<Either<Failure, List<OrderEntity>>> call([NoParam? param]) async {
    // check permission
    return await fetchingOrdersRepo.fetchCancelledOrders(

    );
  }
}