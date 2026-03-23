import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';

class FirestoreHomeServices {
  final CollectionReference _bannersCollectionRef = FirebaseFirestore.instance
      .collection("Banners");

  final CollectionReference _shopsCollectionRef = FirebaseFirestore.instance
      .collection("Shops");

  CollectionReference _shopsProductsCollectionRef(shopId) =>
      _shopsCollectionRef.doc(shopId).collection("Products");

  Future<List<QueryDocumentSnapshot>> getAllBanners() async {
    var value = await _bannersCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getAllShops() async {
    var value = await _shopsCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProductsByShopId({
    required String shopId,
  }) async {
    var value = await _shopsProductsCollectionRef(shopId).get();
    return value.docs;
  }

  Future<void> addBannerToFireStore(BannerModel banner) async {
    final docRef = _bannersCollectionRef.doc();

    final model = BannerModel(
      id: docRef.id,
      name: banner.bannerShopName,
      address: banner.bannerShopAddress,
      phoneNumber: banner.bannerShopPhoneNumber,
      image: banner.bannerImage,
    );

    await docRef.set(model.toJson());
  }

  Future<void> addShopToFireStore(ShopModel shop) async {
    final docRef = _shopsCollectionRef.doc();

    final model = ShopModel(
      Id: docRef.id,
      image: shop.shopImage,
      name: shop.shopName,
      address: shop.shopAddress,
      phoneNumber: shop.shopPhoneNumber,
    );

    await docRef.set(model.toJson());
  }

  Future<void> addShopProductToFireStore({
    required String shopId,
    required ProductModel product,
  }) async {
    // بنوصل للـ Document بتاع المحل وبعدين نفتح Sub-collection باسم products
    final docRef = _shopsProductsCollectionRef(shopId).doc();

    final model = ProductModel(
      id: docRef.id, // بنستخدم الـ ID التلقائي اللي Firestore عمله
      name: product.name,
      price: product.price,
      description: product.description,
      image: product.image,
    );

    await docRef.set(model.toJson());
  }

  Future<void> editProduct({
    required String shopId,
    required String productId,
    required ProductModel updatedProduct,
  }) async {
    try {
      await _shopsProductsCollectionRef(
        shopId,
      ).doc(productId).update(updatedProduct.toJson());
      // ملحوظة: تأكد إن toJson() مش بترجع الـ ID لو مش عايز تخزنه مرتين
    } catch (e) {
      throw Exception("فشل تعديل المنتج: $e");
    }
  }

  Future<void> deleteProduct({
    required String shopId,
    required String productId,
  }) async {
    try {
      await _shopsProductsCollectionRef(shopId).doc(productId).delete();
    } catch (e) {
      throw Exception("فشل حذف المنتج: $e");
    }
  }
}
