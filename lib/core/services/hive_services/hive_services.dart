import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

class HiveServices {
  static const kCompletedOrdersNumberBox = 'completed_orders_number_box';
  static const kDeliveryNumbersBox = 'delivery_numbers_box';
  static const kUsersNumberBox = 'users_number_box';
  static const kBannersBox = 'banners_box';
  static const kShopsBox = 'shops_box';
  static const kPendingOrdersBox = 'pending_orders_box';
  static const kCompletedOrdersBox = 'completed_orders_box';
  static const kCanceledOrdersBox = 'canceled_orders_box';
  static const kAcceptedOrdersBox = 'accepted_orders_box';
  ////////////////////////////////////////////////////////////////
  static const kCompletedOrdersNumberBoxKey = 'completed_orders_number_box_key';
  static const kDeliveryNumbersBoxKey = 'delivery_numbers_box_key';
  static const kUsersNumberBoxKey = 'users_number_box_key';

  static void cacheDeliveriesNumber({required int value}) {
    var box = Hive.box<int>(kDeliveryNumbersBox);
    box.put(kDeliveryNumbersBoxKey, value);
  }

  static void cacheCompletedOrdersNumber({required int value}) {
    var box = Hive.box<int>(kCompletedOrdersNumberBox);
    box.put(kCompletedOrdersNumberBoxKey, value);
  }

  static void cacheUsersNumber({required int value}) {
    var box = Hive.box<int>(kUsersNumberBox);
    box.put(kUsersNumberBoxKey, value);
  }

  static Future<void> clearHiveBox<T>({required String boxName , }) async {
    final box = Hive.box<T>(boxName);
    await box.clear();
  }

  // static Future<void> clearOrdersHiveBox({required String boxName}) async {
  //   var box = Hive.box<OrderEntity>(boxName);
  //   await box.clear();
  // }
  static void initHive() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(HomeBannerEntityAdapter());
    Hive.registerAdapter(HomeShopEntityAdapter());
    Hive.registerAdapter(OrderEntityAdapter());

    // Open boxes
    await Hive.openBox<int>(kDeliveryNumbersBox);
    await Hive.openBox<int>(kCompletedOrdersNumberBox);
    await Hive.openBox<int>(kUsersNumberBox);
    await Hive.openBox<HomeBannerEntity>(kBannersBox);
    await Hive.openBox<HomeShopEntity>(kShopsBox);
    await Hive.openBox<OrderEntity>(kPendingOrdersBox);
    await Hive.openBox<OrderEntity>(kAcceptedOrdersBox);
    await Hive.openBox<OrderEntity>(kCanceledOrdersBox);
    await Hive.openBox<OrderEntity>(kCompletedOrdersBox);


    // Clear boxes
    await clearHiveBox<int>(boxName: kDeliveryNumbersBox);
    await clearHiveBox<int>(boxName: kCompletedOrdersNumberBox);
    await clearHiveBox<int>(boxName: kUsersNumberBox);
    await clearHiveBox<HomeBannerEntity>(boxName: kBannersBox);
    await clearHiveBox<HomeShopEntity>(boxName: kShopsBox);
  }

  static void saveBannersData({
    required List<HomeBannerEntity> banners,
    required String boxName,
  }) {
    var box = Hive.box<HomeBannerEntity>(boxName);
    box.addAll(banners);
  }

  static void saveShopsData({
    required List<HomeShopEntity> shops,
    required String boxName,
  }) {
    var box = Hive.box<HomeShopEntity>(boxName);
    box.addAll(shops);
  }

  static void saveOrdersData({
    required List<OrderEntity> orders,
    required String boxName,
  }) {
    var box = Hive.box<OrderEntity>(boxName);
    box.addAll(orders);
  }
}
