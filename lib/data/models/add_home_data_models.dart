import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

class AddShopProductModelForDomain {
  final String shopId;
  final HomeShopProductEntity newProduct;

  AddShopProductModelForDomain({
    required this.shopId,
    required this.newProduct,
  });
}

class DeleteShopProductModelForDomain {
  final String shopId;
  final String productId;

  DeleteShopProductModelForDomain({
    required this.shopId,
    required this.productId,
  });
}

class EditShopInfoModelForDomain {
  final String shopId;
  final HomeShopEntity newShop;

  EditShopInfoModelForDomain({required this.shopId, required this.newShop});
}

class EditShopInfoModelForData {
  final String shopId;
  final ShopModel newShop;

  EditShopInfoModelForData({required this.shopId, required this.newShop});
}

class EditShopProductModelForDomain {
  final String shopId;
  final String productId;
  final HomeShopProductEntity updatedProduct;

  EditShopProductModelForDomain({
    required this.shopId,
    required this.productId,
    required this.updatedProduct,
  });
}

class DeleteShopProductModelForData {
  final String shopId;
  final String productId;

  DeleteShopProductModelForData({
    required this.shopId,
    required this.productId,
  });
}

class AddShopProductModelForData {
  final String shopId;
  final ProductModel newProduct;

  AddShopProductModelForData({required this.shopId, required this.newProduct});
}

class EditShopProductModelForData {
  final String shopId;
  final String productId;
  final ProductModel updatedProduct;

  EditShopProductModelForData({
    required this.shopId,
    required this.productId,
    required this.updatedProduct,
  });
}

extension AddShopProductMapper on AddShopProductModelForDomain {
  AddShopProductModelForData toDataModel() {
    return AddShopProductModelForData(
      shopId: shopId,
      newProduct: ProductModel.fromEntity(newProduct),
    );
  }
}

extension EditShopProductMapper on EditShopProductModelForDomain {
  EditShopProductModelForData toDataModel() {
    return EditShopProductModelForData(
      shopId: shopId,
      productId: productId,
      updatedProduct: ProductModel.fromEntity(updatedProduct),
    );
  }
}

extension DeleteShopProductMapper on DeleteShopProductModelForDomain {
  DeleteShopProductModelForData toDataModel() {
    return DeleteShopProductModelForData(shopId: shopId, productId: productId);
  }
}

extension EditShopInfoMapper on EditShopInfoModelForDomain {
  EditShopInfoModelForData toDataModel() {
    return EditShopInfoModelForData(
      shopId: shopId,
      newShop: ShopModel.fromEntity(newShop),
    );
  }
}
