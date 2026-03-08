import 'package:flutter/material.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_delivery_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_order_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_users_service.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';

abstract class HomeStatisticsCardsRemoteDataSource {
  Future<int> getTheNumberOfDeliveries();
  Future<int> getTheNumberOfCompletedOrders();
  Future<int> getTheNumberOfUsers();
}

class HomeStatisticsCardsRemoteDataSourceImpl
    implements HomeStatisticsCardsRemoteDataSource {
  FirestoreDeliveryServices firestoreDeliveryServices;
  FirestoreOrdersServices firestoreOrdersServices;
  FirebaseUserServices firebaseUserServices;

  HomeStatisticsCardsRemoteDataSourceImpl(
    this.firestoreDeliveryServices,
    this.firestoreOrdersServices,
    this.firebaseUserServices,
  );

  @override
  Future<int> getTheNumberOfCompletedOrders() async {
    var data = await firestoreOrdersServices.getTheNumberOfTheCompletedOrders();
    HiveServices.cacheCompletedOrdersNumber(value: data);
    return data;
  }

  @override
  Future<int> getTheNumberOfDeliveries() async {
    var data = await firestoreDeliveryServices.getTheNumberOfDeliveries();
    debugPrint("/////////////////// this is data layer");
    debugPrint(data.toString());
    HiveServices.cacheDeliveriesNumber(value: data);
    return data;
  }

  @override
  Future<int> getTheNumberOfUsers() async {
    var data = await firebaseUserServices.getTheNumberOfTheUsers();
    HiveServices.cacheUsersNumber(value: data);
    return data;
  }
}
