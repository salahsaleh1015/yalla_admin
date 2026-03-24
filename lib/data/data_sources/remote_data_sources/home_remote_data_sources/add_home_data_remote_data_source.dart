import 'dart:io';

import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';

abstract class AddHomeDataRemoteDataSource {
  Future<void> addBanner({required BannerModel banner});
  Future<void> addShop({required ShopModel shop});
  Future<String> uploadImage({required File imageFile});
  Future<void> addShopProduct({
    required AddShopProductModelForData addShopProductModel,
  });
  Future<void> editShopProduct({
    required EditShopProductModelForData editShopProductModel,
  });
  Future<void> deleteShopProduct({
    required DeleteShopProductModelForData deleteShopProductModel,
  });
}

class AddHomeDataRemoteDataSourceImpl implements AddHomeDataRemoteDataSource {
  AddHomeDataRemoteDataSourceImpl(
    this.firestoreHomeServices,
    this.firebaseStorageServices,
  );
  FirestoreHomeServices firestoreHomeServices;
  FirebaseStorageServices firebaseStorageServices;

  @override
  Future<void> addBanner({required BannerModel banner}) async {
    await firestoreHomeServices.addBannerToFireStore(banner);
  }

  @override
  Future<String> uploadImage({required File imageFile}) async {
    return await firebaseStorageServices.uploadImageToFirebase(imageFile);
  }

  @override
  Future<void> addShop({required ShopModel shop}) async {
    await firestoreHomeServices.addShopToFireStore(shop);
  }

  @override
  Future<void> addShopProduct({
    required AddShopProductModelForData addShopProductModel,
  }) async {
    await firestoreHomeServices.addShopProductToFireStore(
      shopId: addShopProductModel.shopId,
      product: addShopProductModel.newProduct,
    );
  }

  @override
  Future<void> deleteShopProduct({
    required DeleteShopProductModelForData deleteShopProductModel,
  }) async {
    await firestoreHomeServices.deleteProduct(
      shopId: deleteShopProductModel.shopId,
      productId: deleteShopProductModel.productId,
    );
  }

  @override
  Future<void> editShopProduct({
    required EditShopProductModelForData editShopProductModel,
  }) async {
    await firestoreHomeServices.editProduct(
      shopId: editShopProductModel.shopId,
      productId: editShopProductModel.productId,
      updatedProduct: editShopProductModel.updatedProduct,
    );
  }
}
