


import 'package:cloud_firestore/cloud_firestore.dart';


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
}
