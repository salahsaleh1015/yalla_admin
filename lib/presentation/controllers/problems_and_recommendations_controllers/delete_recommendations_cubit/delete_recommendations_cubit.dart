import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/delete_usecases.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_recommendations_cubit/delete_recommendations_state.dart';

class DeleteRecommendationsCubit extends Cubit<DeleteRecommendationsStates> {
  DeleteRecommendationsCubit(this.deleteRecommendationUseCase)
    : super(DeleteRecommendationsInitialState());
  DeleteRecommendationUseCase deleteRecommendationUseCase;
  static DeleteRecommendationsCubit get(context) => BlocProvider.of(context);

  Future<void> deleteRecommendation({required String recommendationId}) async {
    emit(DeleteRecommendationsLoadingState());

    var result = await deleteRecommendationUseCase.call(recommendationId);

    result.fold(
      (failure) {
        emit(DeleteRecommendationsErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(DeleteRecommendationsSuccessState());
      },
    );
  }
}
