import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreOrdersServices {
  final CollectionReference _ordersCollectionRef = FirebaseFirestore.instance
      .collection("Orders");

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Orders').doc();

  Future<int> getTheNumberOfTheCompletedOrders() async {
    final AggregateQuerySnapshot snapshot =
        await _ordersCollectionRef
            .where("userOrderStatus", isEqualTo: "المكتملة")
            .count()
            .get();
    return snapshot.count!;
  }
}
