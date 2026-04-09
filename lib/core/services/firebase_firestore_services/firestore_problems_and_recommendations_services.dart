
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProblemsAndRecommendationsServices{

  final CollectionReference _problemsCollectionRef = FirebaseFirestore.instance
      .collection("Problems");

  final CollectionReference _recommendationsCollectionRef = FirebaseFirestore.instance
      .collection("Recommendations");


  Future<List<QueryDocumentSnapshot>> fetchAllProblems() async {
    var value = await _problemsCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> fetchAllRecommendations() async {
    var value = await _recommendationsCollectionRef.get();
    return value.docs;
  }
  Future<void> deleteProblem({required String problemId}) async {
    await _problemsCollectionRef.doc(problemId).delete();
  }

  Future<void> deleteRecommendation({required String recommendationId}) async {
    await _recommendationsCollectionRef.doc(recommendationId).delete();
  }

}