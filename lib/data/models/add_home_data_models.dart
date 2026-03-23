import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

class AddShopProductModel {
  final String shopId;
  final HomeShopProductEntity newProduct;

  AddShopProductModel({required this.shopId, required this.newProduct});
}

class DeleteShopProductModel {
  final String shopId;
  final String productId;

  DeleteShopProductModel({required this.shopId, required this.productId});
}

class EditShopProductModel {
  final String shopId;
  final String productId;
  final HomeShopProductEntity updatedProduct;

  EditShopProductModel({
    required this.shopId,
    required this.productId,
    required this.updatedProduct,
  });
}
