import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_delivery_service.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/models/delivery_model.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchingDeliveriesRemoteDataSource {
  Future<List<DeliveryEntity>> fetchAvailableDeliveries();
  Future<List<DeliveryEntity>> fetchUnAvailableDeliveries();
  Future<List<DeliveryEntity>> fetchBusyDeliveries();
}

class FetchingDeliveriesRemoteDataSourceImpl
    implements FetchingDeliveriesRemoteDataSource {
  FirestoreDeliveryServices firestoreDeliveryServices;

  FetchingDeliveriesRemoteDataSourceImpl(this.firestoreDeliveryServices);

  @override
  Future<List<DeliveryEntity>> fetchAvailableDeliveries() async {
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
      deliveryStatus: "متاح",
    );
    List<DeliveryEntity> availableDeliveries = getDeliveriesList(data);
    HiveServices.saveDeliveriesData(
      deliveries: availableDeliveries,
      boxName: HiveServices.kAvailableDeliveryBox,
    );
    return availableDeliveries;
  }

  @override
  Future<List<DeliveryEntity>> fetchBusyDeliveries() async{
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
      deliveryStatus: "مشغول"
      ,
    );
    List<DeliveryEntity> busyDeliveries = getDeliveriesList(data);
    HiveServices.saveDeliveriesData(
      deliveries: busyDeliveries,
      boxName: HiveServices.kBusyDeliveryBox,
    );
    return busyDeliveries;
  }

  @override
  Future<List<DeliveryEntity>> fetchUnAvailableDeliveries() async{
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
      deliveryStatus: "غير متاح"
      ,
    );
    List<DeliveryEntity> unAvailableDeliveries = getDeliveriesList(data);
    HiveServices.saveDeliveriesData(
      deliveries: unAvailableDeliveries,
      boxName: HiveServices.kUnAvailableDeliveryBox,
    );
    return unAvailableDeliveries;
  }


  List<DeliveryEntity> getDeliveriesList(List<QueryDocumentSnapshot> docs) {
    List<DeliveryEntity> deliveries = [];

    for (var doc in docs) {
      deliveries.add(DeliveryModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return deliveries;
  }
}
