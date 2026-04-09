import 'package:hive/hive.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

abstract class ProblemsAndRecommendationsLocalDataSource {
  List<ProblemEntity> fetchAllProblems();
  List<RecommendationEntity> fetchAllRecommendations();
}

class ProblemsAndRecommendationsLocalDataSourceImpl
    implements ProblemsAndRecommendationsLocalDataSource {
  @override
  List<ProblemEntity> fetchAllProblems() {
    var box = Hive.box<ProblemEntity>(HiveServices.kProblemsBox);
    return box.values.toList();
  }

  @override
  List<RecommendationEntity> fetchAllRecommendations() {
    var box = Hive.box<RecommendationEntity>(HiveServices.kRecommendationsBox);
    return box.values.toList();
  }
}
