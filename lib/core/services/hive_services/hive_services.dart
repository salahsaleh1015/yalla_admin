import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

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
  static const kAvailableDeliveryBox = 'available_delivery_box';
  static const kUnAvailableDeliveryBox = 'unAvailable_delivery_box';
  static const kBusyDeliveryBox = 'busy_delivery_box';
  ////////////////////////////////////////////////////////////////
  static const kCompletedOrdersNumberBoxKey = 'completed_orders_number_box_key';
  static const kDeliveryNumbersBoxKey = 'delivery_numbers_box_key';
  static const kUsersNumberBoxKey = 'users_number_box_key';
  // static const kAvailableDeliveriesBox = 'available_deliveries_box';
  // static const kUnAvailableDeliveriesBox = 'unAvailable_deliveries_box';
  // static const kBusyDeliveriesBox = 'busy_deliveries_box';
  static const kProblemsBox = "problems_box";
  static const kRecommendationsBox = "recommendations_box";

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
  static Future<void> initHive() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(HomeBannerEntityAdapter());
    Hive.registerAdapter(HomeShopEntityAdapter());
    Hive.registerAdapter(OrderEntityAdapter());
    Hive.registerAdapter(DeliveryEntityAdapter());
    Hive.registerAdapter(ProblemEntityAdapter());
    Hive.registerAdapter(RecommendationEntityAdapter());


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
    await Hive.openBox<DeliveryEntity>(kAvailableDeliveryBox);
    await Hive.openBox<DeliveryEntity>(kUnAvailableDeliveryBox);
    await Hive.openBox<DeliveryEntity>(kBusyDeliveryBox);
    await Hive.openBox<ProblemEntity>(kProblemsBox);

    await Hive.openBox<RecommendationEntity>(kRecommendationsBox);

    // Clear boxes
    await clearHiveBox<int>(boxName: kDeliveryNumbersBox);
    await clearHiveBox<int>(boxName: kCompletedOrdersNumberBox);
    await clearHiveBox<int>(boxName: kUsersNumberBox);
    await clearHiveBox<OrderEntity>(boxName: kAcceptedOrdersBox);
    await clearHiveBox<OrderEntity>(boxName: kPendingOrdersBox);
    await clearHiveBox<OrderEntity>(boxName: kCanceledOrdersBox);
    await clearHiveBox<OrderEntity>(boxName: kCompletedOrdersBox);
    await clearHiveBox<HomeBannerEntity>(boxName: kBannersBox);
    await clearHiveBox<HomeShopEntity>(boxName: kShopsBox);
    await clearHiveBox<DeliveryEntity>(boxName: kAvailableDeliveryBox);
    await clearHiveBox<DeliveryEntity>(boxName: kUnAvailableDeliveryBox);
    await clearHiveBox<DeliveryEntity>(boxName: kBusyDeliveryBox);
    await clearHiveBox<ProblemEntity>(boxName: kProblemsBox);
    await clearHiveBox<RecommendationEntity>(boxName: kRecommendationsBox);

  }

  static void saveDeliveriesData({
    required List<DeliveryEntity> deliveries,
    required String boxName,
  }) {
    var box = Hive.box<DeliveryEntity>(boxName);
    box.addAll(deliveries);
  }
  static void saveBannersData({
    required List<HomeBannerEntity> banners,
    required String boxName,
  }) {
    var box = Hive.box<HomeBannerEntity>(boxName);
    box.addAll(banners);
  }

  static void saveProblemsData({
    required List<ProblemEntity> problems,
    required String boxName,
  }){
    var box = Hive.box<ProblemEntity>(boxName);
    box.addAll(problems);
  }

  static void saveRecommendationsData({
    required List<RecommendationEntity> recommendations,
    required String boxName,
  }){
    var box = Hive.box<RecommendationEntity>(boxName);
    box.addAll(recommendations);
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
