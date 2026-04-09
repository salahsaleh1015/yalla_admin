import 'package:dartz/dartz.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';

class FetchAllProblemsUseCase
    extends UseCase<List<ProblemEntity>, NoParam> {
  ProblemsAndRecommendationsRepo problemsAndRecommendationsRepo;

  FetchAllProblemsUseCase(this.problemsAndRecommendationsRepo);

  @override
  Future<Either<Failure, List<ProblemEntity>>> call([NoParam? param]) async {
    // check permission
    return await problemsAndRecommendationsRepo.fetchAllProblems();
  }
}
