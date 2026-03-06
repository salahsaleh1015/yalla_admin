


import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserServices {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("Users");

  final DocumentReference documentReference =
  FirebaseFirestore.instance.collection('Users').doc();



  Future<int> getTheNumberOfTheUsers() async {
    final AggregateQuerySnapshot snapshot =
    await _userCollectionRef.count().get();
    return snapshot.count!;
  }
}