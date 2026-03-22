import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/product_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class HomeBannersAndShopsRemoteDataSource {
  Future<List<HomeBannerEntity>> getHomeBanners();
  Future<List<HomeShopEntity>> getHomeShops();
  Future<List<HomeShopProductEntity>> getShopProducts({required String shopId});
}

class HomeBannersAndShopsRemoteDataSourceImpl
    implements HomeBannersAndShopsRemoteDataSource {
  FirestoreHomeServices firestoreHomeServices;
  HomeBannersAndShopsRemoteDataSourceImpl(this.firestoreHomeServices);

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
  Future<List<HomeShopProductEntity>> getShopProducts({
    required String shopId,
  }) async {
    var data = await firestoreHomeServices.getProductsByShopId(shopId: shopId);
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
}
