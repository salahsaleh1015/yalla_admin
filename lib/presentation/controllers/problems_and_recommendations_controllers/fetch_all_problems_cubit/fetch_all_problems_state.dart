import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';

abstract class FetchAllProblemsStates {}

final class FetchAllProblemsInitialState extends FetchAllProblemsStates {}

final class FetchAllProblemsLoadingState extends FetchAllProblemsStates {}

final class FetchAllProblemsSuccessState extends FetchAllProblemsStates {
 final List<ProblemEntity> problems;

  FetchAllProblemsSuccessState({required this.problems});
}

final class FetchAllProblemsErrorState extends FetchAllProblemsStates {
  final String errorMsg;

  FetchAllProblemsErrorState({required this.errorMsg});

}
