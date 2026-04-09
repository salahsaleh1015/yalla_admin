import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_problems_and_recommendations_services.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/models/recommendation_model.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

import '../../../models/problem_model.dart';

abstract class ProblemsAndRecommendationsRemoteDataSource {
  Future<List<ProblemEntity>> fetchAllProblems();
  Future<List<RecommendationEntity>> fetchAllRecommendations();
  Future<void> deleteProblem({required String problemId});
  Future<void> deleteRecommendation({required String recommendationId});
}

class ProblemsAndRecommendationsRemoteDataSourceImpl
    implements ProblemsAndRecommendationsRemoteDataSource {
  final FireStoreProblemsAndRecommendationsServices
  fireStoreProblemsAndRecommendationsServices;

  ProblemsAndRecommendationsRemoteDataSourceImpl({
    required this.fireStoreProblemsAndRecommendationsServices,
  });

  @override
  Future<void> deleteProblem({required String problemId}) async {
    await fireStoreProblemsAndRecommendationsServices.deleteProblem(
      problemId: problemId,
    );
  }

  @override
  Future<void> deleteRecommendation({required String recommendationId}) async {
    await fireStoreProblemsAndRecommendationsServices.deleteRecommendation(
      recommendationId: recommendationId,
    );
  }

  @override
  Future<List<ProblemEntity>> fetchAllProblems() async {
    var data =
        await fireStoreProblemsAndRecommendationsServices.fetchAllProblems();

    List<ProblemEntity> problems = getProblemsList(data);
    HiveServices.saveProblemsData(
      problems: problems,
      boxName: HiveServices.kProblemsBox,
    );
    return problems;
  }

  @override
  Future<List<RecommendationEntity>> fetchAllRecommendations() async {
    var data =
        await fireStoreProblemsAndRecommendationsServices
            .fetchAllRecommendations();

    List<RecommendationEntity> recommendations = getRecommendationsList(data);
    HiveServices.saveRecommendationsData(
      recommendations: recommendations,
      boxName: HiveServices.kRecommendationsBox,
    );
    return recommendations;
  }

  List<ProblemEntity> getProblemsList(List<QueryDocumentSnapshot> docs) {
    List<ProblemEntity> problems = [];

    for (var doc in docs) {
      problems.add(
        ProblemModel.fromJson(
          doc.data() as Map<String, dynamic>,
        ), // 🔥 مش fromJson
      );
    }

    return problems;
  }

  List<RecommendationEntity> getRecommendationsList(
    List<QueryDocumentSnapshot> docs,
  ) {
    List<RecommendationEntity> recommendations = [];

    for (var doc in docs) {
      recommendations.add(
        RecommendationModel.fromJson(doc.data() as Map<String, dynamic>),
      );
    }

    return recommendations;
  }
}
