import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';

import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';

class FirestoreHomeServices {

  FirebaseStorageServices _storageServices =  FirebaseStorageServices();

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
      id: docRef.id,
      image: shop.shopImage,
      name: shop.shopName,
      address: shop.shopAddress,
      phoneNumber: shop.shopPhoneNumber,
      rate: shop.rate
    );

    await docRef.set(model.toJson());
  }



  Future<void> deleteBanner({
    required DeleteBannerModelForData deleteBannerModel,
  }) async {
    try {
      final docRef = _bannersCollectionRef.doc(deleteBannerModel.bannerId);

      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        throw Exception("Banner not found");
      }

      // Delete image
      if (deleteBannerModel.bannerImageUrl.isNotEmpty) {
        await _storageServices.deleteImageFromFirebase(
          deleteBannerModel.bannerImageUrl,
        );
      }

      // Delete doc
      await docRef.delete();

    } catch (e) {
      print("Delete banner error: $e");
      rethrow;
    }
  }

}
