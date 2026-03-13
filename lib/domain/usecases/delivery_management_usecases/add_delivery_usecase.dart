import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/fetching_deliveries_repo.dart';

class AddDeliveriesUseCase extends UseCase<void, DeliveryEntity> {
  ActionsOfDeliveriesRepo actionsOfDeliveriesRepo;
  AddDeliveriesUseCase(this.actionsOfDeliveriesRepo);

  @override
  Future<Either<Failure, void>> call(DeliveryEntity delivery) async {
    // check permission
    return await actionsOfDeliveriesRepo.addDelivery(delivery: delivery);
  }
}
