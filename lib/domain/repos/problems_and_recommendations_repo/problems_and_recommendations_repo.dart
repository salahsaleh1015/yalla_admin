import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

abstract class ProblemsAndRecommendationsRepo {
  Future<Either<Failure, List<ProblemEntity>>> fetchAllProblems();
  Future<Either<Failure, List<RecommendationEntity>>> fetchAllRecommendations();
  Future<Either<Failure, void>> deleteProblem({required String problemId});
  Future<Either<Failure, void>> deleteRecommendation({
    required String recommendationId,
  });
}
