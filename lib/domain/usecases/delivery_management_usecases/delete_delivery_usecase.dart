


import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/delete_delivery_model.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/actions_of_deliveries_repo.dart';

class DeleteDeliveriesUseCase extends UseCase<void, String> {
  ActionsOfDeliveriesRepo actionsOfDeliveriesRepo;
  DeleteDeliveriesUseCase(this.actionsOfDeliveriesRepo);

  @override
  Future<Either<Failure, void>> call(String deliveryId) async {
    // check permission
    return await actionsOfDeliveriesRepo.deleteDelivery( deliveryId: deliveryId);
  }
}
