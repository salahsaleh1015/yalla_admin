abstract class DeleteRecommendationsStates {}

final class DeleteRecommendationsInitialState extends DeleteRecommendationsStates {}

final class DeleteRecommendationsLoadingState extends DeleteRecommendationsStates {}

final class DeleteRecommendationsSuccessState extends DeleteRecommendationsStates {}

final class DeleteRecommendationsErrorState extends DeleteRecommendationsStates {
  final String errorMsg;

  DeleteRecommendationsErrorState({required this.errorMsg});
}
