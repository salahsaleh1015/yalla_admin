



import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';

import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class AddShopProductUseCase extends UseCase<void, AddShopProductModelForDomain> {
  AddHomeDataRepo addHomeDataRepo;

  AddShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(AddShopProductModelForDomain addProduct) async {
    return await addHomeDataRepo.addShopProduct(addShopProductModel: addProduct);
  }
}


class EditShopProductUseCase extends UseCase<void, EditShopProductModelForDomain> {
  AddHomeDataRepo addHomeDataRepo;

  EditShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(EditShopProductModelForDomain editProduct) async {
    return await addHomeDataRepo.editShopProduct(editShopProductModel: editProduct);
  }
}


class DeleteShopProductUseCase extends UseCase<void, DeleteShopProductModelForDomain> {
  AddHomeDataRepo addHomeDataRepo;

  DeleteShopProductUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, void>> call(DeleteShopProductModelForDomain deleteProduct) async {
    return await addHomeDataRepo.deleteShopProduct(deleteShopProductModel: deleteProduct);
  }
}
