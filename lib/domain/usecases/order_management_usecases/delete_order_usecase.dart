import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/repos/order_management_repos/fetching_orders_repo.dart';

class DeleteOrderUseCase extends UseCase<void, String> {
  FetchingOrdersRepo fetchingOrdersRepo;
  DeleteOrderUseCase(this.fetchingOrdersRepo);

  @override
  Future<Either<Failure, void>> call(String param) async {
    // check permission
    return await fetchingOrdersRepo.deleteOrderById(orderId: param);
  }
}
