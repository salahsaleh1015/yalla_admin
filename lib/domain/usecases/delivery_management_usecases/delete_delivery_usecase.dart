


import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/delete_delivery_model.dart';
import 'package:yalla_admin/domain/repos/delivery_management_repos/actions_of_deliveries_repo.dart';

class DeleteDeliveriesUseCase extends UseCase<void, DeleteDeliveryModel> {
  ActionsOfDeliveriesRepo actionsOfDeliveriesRepo;
  DeleteDeliveriesUseCase(this.actionsOfDeliveriesRepo);

  @override
  Future<Either<Failure, void>> call(DeleteDeliveryModel delivery) async {
    // check permission
    return await actionsOfDeliveriesRepo.deleteDelivery(deleteDeliveryModel: delivery);
  }
}
