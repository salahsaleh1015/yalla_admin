import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeBannerEntity>> getHomeBanners();
  Future<List<HomeShopEntity>> getHomeShops();
  Future<void> addBanner({required BannerModel banner});
  Future<void> addShop({required ShopModel shop});
  Future<String> uploadImage({required File imageFile});
  Future<void> deleteBanner({required DeleteBannerModelForData deleteBannerModel});
}

class HomeRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  FirestoreHomeServices firestoreHomeServices;
  FirebaseStorageServices firebaseStorageServices;
  HomeRemoteDataSourceImpl(
    this.firestoreHomeServices,
    this.firebaseStorageServices,
  );

  @override
  Future<List<HomeBannerEntity>> getHomeBanners() async {
    var data = await firestoreHomeServices.getAllBanners();
    List<HomeBannerEntity> banners = getBannersList(data);
    HiveServices.saveBannersData(
      banners: banners,
      boxName: HiveServices.kBannersBox,
    );
    return banners;
  }

  List<HomeBannerEntity> getBannersList(List<QueryDocumentSnapshot> docs) {
    List<HomeBannerEntity> banners = [];

    for (var doc in docs) {
      banners.add(BannerModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return banners;
  }

  @override
  Future<List<HomeShopEntity>> getHomeShops() async {
    var data = await firestoreHomeServices.getAllShops();
    List<HomeShopEntity> shops = getShopsList(data);
    HiveServices.saveShopsData(shops: shops, boxName: HiveServices.kShopsBox);
    return shops;
  }

  List<HomeShopEntity> getShopsList(List<QueryDocumentSnapshot> docs) {
    List<HomeShopEntity> shops = [];

    for (var doc in docs) {
      shops.add(ShopModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return shops;
  }



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
  Future<void> deleteBanner({required DeleteBannerModelForData deleteBannerModel})async {
    await firestoreHomeServices.deleteBanner(deleteBannerModel: deleteBannerModel);
  }
}
