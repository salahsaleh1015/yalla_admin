
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/data/models/edit_shop_image_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';


class FirestoreHomeDetailsServices {
  final CollectionReference _shopsCollectionRef = FirebaseFirestore.instance
      .collection("Shops");

  CollectionReference _productsCollectionRef(shopId) =>
      _shopsCollectionRef.doc(shopId).collection("Products");


  Future<List<QueryDocumentSnapshot>> getProductsByShopId({
    required String shopId,
  }) async {
    var value = await _productsCollectionRef(shopId).get();
    return value.docs;
  }


  Future<void> addProductToFireStore({
    required String shopId,
    required ProductModel product,
  }) async {
    // بنوصل للـ Document بتاع المحل وبعدين نفتح Sub-collection باسم products
    final docRef = _productsCollectionRef(shopId).doc();

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
      await _productsCollectionRef(
        shopId,
      ).doc(productId).update(updatedProduct.toJson());
    } catch (e) {
      throw Exception("فشل تعديل المنتج: $e");
    }
  }

  Future<void> deleteProduct({
    required String shopId,
    required String productId,
  }) async {
    try {
      await _productsCollectionRef(shopId).doc(productId).delete();
    } catch (e) {
      throw Exception("فشل حذف المنتج: $e");
    }
  }

  Future<void> editShopInfo({
    required String shopId,
    required ShopModel newShopInfo,
  }) async {
    try {
      await _shopsCollectionRef.doc(shopId).update(newShopInfo.toJson());
    } catch (e) {
      throw Exception("فشل تعديل معلومانت المحل: $e");
    }
  }

  Future<void> editShopImage({
    required EditShopImageModel editShopImageModel,

  }) async {
    try {
      await _shopsCollectionRef.doc(editShopImageModel.shopId).update({
        "shopImage": editShopImageModel.imageUrl,
      });
    } catch (e) {
      throw Exception("فشل تحديث الصورة: $e");
    }
  }

  Future<void> deleteShop({required String shopId})async{
    await _shopsCollectionRef.doc(shopId).delete();
  }
}