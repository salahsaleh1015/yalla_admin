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

  Future<List<QueryDocumentSnapshot>> getPendingOrders() async {
    QuerySnapshot querySnapshot =
        await _ordersCollectionRef
            .where("userOrderStatus", isEqualTo: "المعلقة")
            .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getAcceptedOrders() async {
    QuerySnapshot querySnapshot =
        await _ordersCollectionRef
            .where("userOrderStatus", isEqualTo: "المقبولة")
            .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCanceledOrders() async {
    QuerySnapshot querySnapshot =
        await _ordersCollectionRef
            .where("userOrderStatus", isEqualTo: "الملغية")
            .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCompletedOrders() async {
    QuerySnapshot querySnapshot =
        await _ordersCollectionRef
            .where("userOrderStatus", isEqualTo: "مكتملة")
            .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<void> deleteOrder({required String orderId}) async {
    await _ordersCollectionRef.doc(orderId).delete();
  }
}
