import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_delivery_service.dart';
import 'package:yalla_admin/data/models/delete_delivery_model.dart';

import '../../../models/delivery_model.dart';

abstract class ActionsOfDeliveriesRemoteDataSource {
  Future<void> addDelivery({required DeliveryModel deliveryModel});
  Future<void> deleteDelivery({required String deliveryId});
  Future<void> updateDelivery({required DeliveryModel deliveryModel});
}

class ActionsOfDeliveriesRemoteDataSourceImpl
    implements ActionsOfDeliveriesRemoteDataSource {
  FirestoreDeliveryServices firestoreDeliveryServices;

  ActionsOfDeliveriesRemoteDataSourceImpl(this.firestoreDeliveryServices);

  @override
  Future<void> addDelivery({required DeliveryModel deliveryModel}) async {
    await firestoreDeliveryServices.addDelivery(delivery: deliveryModel);
  }

  @override
  Future<void> deleteDelivery({required String deliveryId}) async {
    await firestoreDeliveryServices.deleteOrder(deliveryId: deliveryId);
  }

  @override
  Future<void> updateDelivery({required DeliveryModel deliveryModel}) async {
    await firestoreDeliveryServices.updateDelivery(deliveryModel);
  }
}
