
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import 'package:yalla_admin/domain/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';

class FetchAllRecommendationsUseCase
    extends UseCase<List<RecommendationEntity>, NoParam> {
  ProblemsAndRecommendationsRepo problemsAndRecommendationsRepo;

  FetchAllRecommendationsUseCase(this.problemsAndRecommendationsRepo);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call([NoParam? param]) async {
    // check permission
    return await problemsAndRecommendationsRepo.fetchAllRecommendations();
  }
}
