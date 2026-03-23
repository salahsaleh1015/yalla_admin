



import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';

import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class AddShopProductUseCase extends UseCase<void, AddShopProductModel> {
  AddHomeDataRepo addHomeDataRepo;

  AddShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(AddShopProductModel addProduct) async {
    return await addHomeDataRepo.addShopProduct(addShopProductModel: addProduct);
  }
}


class EditShopProductUseCase extends UseCase<void, EditShopProductModel> {
  AddHomeDataRepo addHomeDataRepo;

  EditShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(EditShopProductModel editProduct) async {
    return await addHomeDataRepo.editShopProduct(editShopProductModel: editProduct);
  }
}


class DeleteShopProductUseCase extends UseCase<void, DeleteShopProductModel> {
  AddHomeDataRepo addHomeDataRepo;

  DeleteShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(DeleteShopProductModel deleteProduct) async {
    return await addHomeDataRepo.deleteShopProduct(deleteShopProductModel: deleteProduct);
  }
}
