import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/edit_shop_image_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';
import '../../entities/home_entities/home_shop_entity.dart';

class AddProductUseCase extends UseCase<void, AddShopProductModelForDomain> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  AddProductUseCase(this.homeDetailsTransactionsRepo);
  @override
  Future<Either<Failure, void>> call(
    AddShopProductModelForDomain addProduct,
  ) async {
    return await homeDetailsTransactionsRepo.addProduct(
      addShopProductModel: addProduct,
    );
  }
}

class EditProductUseCase extends UseCase<void, EditShopProductModelForDomain> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  EditProductUseCase(this.homeDetailsTransactionsRepo);
  @override
  Future<Either<Failure, void>> call(
    EditShopProductModelForDomain editProduct,
  ) async {
    return await homeDetailsTransactionsRepo.editProduct(
      editShopProductModel: editProduct,
    );
  }
}

class DeleteProductUseCase
    extends UseCase<void, DeleteShopProductModelForDomain> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  DeleteProductUseCase(this.homeDetailsTransactionsRepo);
  @override
  Future<Either<Failure, void>> call(
    DeleteShopProductModelForDomain deleteProduct,
  ) async {
    return await homeDetailsTransactionsRepo.deleteProduct(
      deleteShopProductModel: deleteProduct,
    );
  }
}

class GetProductsUseCase extends UseCase<List<HomeShopProductEntity>, String> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  GetProductsUseCase(this.homeDetailsTransactionsRepo);
  @override
  Future<Either<Failure, List<HomeShopProductEntity>>> call(
    String shopId,
  ) async {
    return await homeDetailsTransactionsRepo.fetchProducts(shopId: shopId);
  }
}

class EditShopInfoUseCase extends UseCase<void, EditShopInfoModelForDomain> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  EditShopInfoUseCase(this.homeDetailsTransactionsRepo);

  @override
  Future<Either<Failure, void>> call(EditShopInfoModelForDomain newShop) async {
    return await homeDetailsTransactionsRepo.editShopInfo(editShopInfoModel: newShop);
  }
}



class DeleteShopUseCase extends UseCase<void, String> {
  HomeDetailsTransactionsRepo homeDetailsTransactionsRepo;

  DeleteShopUseCase(this.homeDetailsTransactionsRepo);
  @override
  Future<Either<Failure, void>> call(String shopId) async {
    return await homeDetailsTransactionsRepo.deleteShop(shopId: shopId);
  }
}
