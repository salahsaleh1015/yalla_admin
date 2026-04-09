import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';

import '../../../core/errors/failure.dart';

class DeleteProblemUseCase extends UseCase<void, String> {
  ProblemsAndRecommendationsRepo problemsAndRecommendationsRepo;
  DeleteProblemUseCase(this.problemsAndRecommendationsRepo);

  @override
  Future<Either<Failure, void>> call(String param) async {
    // check permission
    return await problemsAndRecommendationsRepo.deleteProblem(problemId: param);
  }
}

class DeleteRecommendationUseCase extends UseCase<void, String> {
  ProblemsAndRecommendationsRepo problemsAndRecommendationsRepo;
  DeleteRecommendationUseCase(this.problemsAndRecommendationsRepo);

  @override
  Future<Either<Failure, void>> call(String param) async {
    // check permission
    return await problemsAndRecommendationsRepo.deleteRecommendation(
      recommendationId: param,
    );
  }
}
