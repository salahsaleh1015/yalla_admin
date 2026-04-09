import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/fetch_all_recommendations_usecase.dart';

import 'fetch_all_recommendations_state.dart';

class FetchAllRecommendationsCubit
    extends Cubit<FetchAllRecommendationsStates> {
  FetchAllRecommendationsCubit(this.fetchAllRecommendationsUseCase)
    : super(FetchAllRecommendationsInitialState());
  FetchAllRecommendationsUseCase fetchAllRecommendationsUseCase;
  static FetchAllRecommendationsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchAllRecommendations() async {
    emit(FetchAllRecommendationsLoadingState());

    var result = await fetchAllRecommendationsUseCase.call();

    result.fold(
      (failure) {
        emit(FetchAllRecommendationsErrorState(errorMsg: failure.message));
      },
      (recommendations) {
        emit(
          FetchAllRecommendationsSuccessState(recommendations: recommendations),
        );
      },
    );
  }
}
