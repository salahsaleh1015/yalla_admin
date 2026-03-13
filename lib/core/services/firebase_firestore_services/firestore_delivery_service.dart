


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/data/models/delivery_model.dart';


class FirestoreDeliveryServices {
  final CollectionReference _deliveryCollectionRef = FirebaseFirestore.instance
      .collection("Deliveries");

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Deliveries').doc();

  Future<int> getTheNumberOfDeliveries() async {
    final AggregateQuerySnapshot snapshot =
    await _deliveryCollectionRef.count().get();
    return snapshot.count!;
  }



  Future<List<QueryDocumentSnapshot>> getAllDeliveriesByStatus(
      {required String deliveryStatus}) async {
    var value = await _deliveryCollectionRef
        .where('deliveryStatus', isEqualTo: deliveryStatus)
        .get();
    return value.docs;
  }

  Future<void> addDelivery({required DeliveryModel delivery})async{
    String deliveryId = documentReference.id;
    delivery.id = deliveryId;
    await _deliveryCollectionRef.doc(deliveryId).set(delivery.toJson());
  }

  Future<void> updateDelivery(DeliveryModel delivery) async {

    // Step 1: Search for user by id
    final querySnapshot = await _deliveryCollectionRef
        .where('deliveryId', isEqualTo: delivery.id)
        .limit(1)
        .get();

    // Step 2: Get the document ID
    final docId = querySnapshot.docs.first.id;

    // Step 3: Update the document
    await _deliveryCollectionRef.doc(docId).update(delivery.toJson());
  }


  Future<void> deleteOrder({required String deliveryId}) async {
    await _deliveryCollectionRef.doc(deliveryId).delete();
  }

}
