


import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/fetching_deliveries_repo.dart';

class FetchBusyDeliveriesUseCase
    extends UseCase<List<DeliveryEntity>, NoParam> {
  FetchingDeliveriesRepo fetchingDeliveriesRepo;
  FetchBusyDeliveriesUseCase(this.fetchingDeliveriesRepo);

  @override
  Future<Either<Failure, List<DeliveryEntity>>> call([NoParam? param]) async {
    // check permission
    return await fetchingDeliveriesRepo.fetchBusyDeliveries();
  }
}
