import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_details_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/edit_shop_image_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class HomeDetailsRemoteDataSource {
  Future<List<HomeShopProductEntity>> getShopProducts({required String shopId});
  Future<void> addProduct({
    required AddShopProductModelForData addShopProductModel,
  });
  Future<void> editProduct({
    required EditShopProductModelForData editShopProductModel,
  });
  Future<void> deleteProduct({
    required DeleteShopProductModelForData deleteShopProductModel,
  });
  Future<void> editShopInfo({required EditShopInfoModelForData newShopInfo});

  Future<void> deleteShop({required String shopId});

  Future<void> editShopImage({required EditShopImageModel editShopImageModel});
}

class HomeDetailsRemoteDataSourceImpl implements HomeDetailsRemoteDataSource {
  HomeDetailsRemoteDataSourceImpl(this.firestoreHomeDetailsServices);
  FirestoreHomeDetailsServices firestoreHomeDetailsServices;

  @override
  Future<void> addProduct({
    required AddShopProductModelForData addShopProductModel,
  }) async {
    await firestoreHomeDetailsServices.addProductToFireStore(
      shopId: addShopProductModel.shopId,
      product: addShopProductModel.newProduct,
    );
  }

  @override
  Future<void> deleteProduct({
    required DeleteShopProductModelForData deleteShopProductModel,
  }) async {
    await firestoreHomeDetailsServices.deleteProduct(
      shopId: deleteShopProductModel.shopId,
      productId: deleteShopProductModel.productId,
    );
  }

  @override
  Future<void> editProduct({
    required EditShopProductModelForData editShopProductModel,
  }) async {
    await firestoreHomeDetailsServices.editProduct(
      shopId: editShopProductModel.shopId,
      productId: editShopProductModel.productId,
      updatedProduct: editShopProductModel.updatedProduct,
    );
  }

  @override
  Future<void> editShopInfo({required EditShopInfoModelForData newShopInfo}) async {
    await firestoreHomeDetailsServices.editShopInfo(
      shopId: newShopInfo.shopId,
      newShopInfo: newShopInfo.newShop,
    );
  }

  @override
  Future<List<HomeShopProductEntity>> getShopProducts({
    required String shopId,
  }) async {
    var data = await firestoreHomeDetailsServices.getProductsByShopId(
      shopId: shopId,
    );
    List<HomeShopProductEntity> products = getProductsList(data);
    return products;
  }

  List<HomeShopProductEntity> getProductsList(
    List<QueryDocumentSnapshot> docs,
  ) {
    List<HomeShopProductEntity> products = [];

    for (var doc in docs) {
      products.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return products;
  }

  @override
  Future<void> deleteShop({required String shopId}) async {
    await firestoreHomeDetailsServices.deleteShop(shopId: shopId);
  }

  @override
  Future<void> editShopImage({
    required EditShopImageModel editShopImageModel,
  }) async {
    await firestoreHomeDetailsServices.editShopImage(
      editShopImageModel: editShopImageModel,
    );
  }
}
