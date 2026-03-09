import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_order_service.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

import '../../../models/order_model.dart';

abstract class FetchingOrdersRemoteDataSource {
  Future<List<OrderEntity>> fetchAllOrders();
  Future<List<OrderEntity>> fetchCanceledOrders();
  Future<List<OrderEntity>> fetchCompletedOrders();
  Future<List<OrderEntity>> fetchAcceptedOrders();
}

class FetchingOrdersRemoteDataSourceImpl
    implements FetchingOrdersRemoteDataSource {
  FirestoreOrdersServices firestoreOrdersServices;

  FetchingOrdersRemoteDataSourceImpl(this.firestoreOrdersServices);

  @override
  Future<List<OrderEntity>> fetchAcceptedOrders() async {
    var data = await firestoreOrdersServices.getAcceptedOrders();
    List<OrderEntity> acceptedOrders = getOrdersList(data);
    HiveServices.saveOrdersData(
      orders: acceptedOrders,
      boxName: HiveServices.kAcceptedOrdersBox,
    );
    return acceptedOrders;
  }

  @override
  Future<List<OrderEntity>> fetchAllOrders() async{
    var data = await firestoreOrdersServices.getAllOrders();
    List<OrderEntity> allOrders = getOrdersList(data);
    HiveServices.saveOrdersData(
      orders: allOrders,
      boxName: HiveServices.kAllOrdersBox,
    );
    return allOrders;
  }

  @override
  Future<List<OrderEntity>> fetchCanceledOrders() async{
    var data = await firestoreOrdersServices.getCanceledOrders();
    List<OrderEntity> canceledOrders = getOrdersList(data);
    HiveServices.saveOrdersData(
      orders: canceledOrders,
      boxName: HiveServices.kCanceledOrdersBox,
    );
    return canceledOrders;
  }

  @override
  Future<List<OrderEntity>> fetchCompletedOrders() async{
    var data = await firestoreOrdersServices.getCompletedOrders();
    List<OrderEntity> completedOrders = getOrdersList(data);
    HiveServices.saveOrdersData(
      orders: completedOrders,
      boxName: HiveServices.kCompletedOrdersBox,
    );
    return completedOrders;
  }

  List<OrderEntity> getOrdersList(List<QueryDocumentSnapshot> docs) {
    List<OrderEntity> orders = [];

    for (var doc in docs) {
      orders.add(OrderModelData.fromJson(doc.data() as Map<String, dynamic>));
    }

    return orders;
  }
}
