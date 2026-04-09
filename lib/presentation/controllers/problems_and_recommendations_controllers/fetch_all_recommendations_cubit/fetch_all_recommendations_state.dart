import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

abstract class FetchAllRecommendationsStates {}

final class FetchAllRecommendationsInitialState extends FetchAllRecommendationsStates {}

final class FetchAllRecommendationsLoadingState extends FetchAllRecommendationsStates {}

final class FetchAllRecommendationsSuccessState extends FetchAllRecommendationsStates {
  final List<RecommendationEntity> recommendations;

  FetchAllRecommendationsSuccessState({required this.recommendations});
}

final class FetchAllRecommendationsErrorState extends FetchAllRecommendationsStates {
  final String errorMsg;

  FetchAllRecommendationsErrorState({required this.errorMsg});

}
