import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/fetch_all_problems_usecase.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/fetch_all_problems_cubit/fetch_all_problems_state.dart';

class FetchAllProblemsCubit extends Cubit<FetchAllProblemsStates> {
  FetchAllProblemsCubit(this.fetchAllProblemsUseCase)
    : super(FetchAllProblemsInitialState());
  FetchAllProblemsUseCase fetchAllProblemsUseCase;
  static FetchAllProblemsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchAllProblems() async {
    emit(FetchAllProblemsLoadingState());

    var result = await fetchAllProblemsUseCase.call();

    result.fold(
      (failure) {
        emit(FetchAllProblemsErrorState(errorMsg: failure.message));
      },
      (problems) {
        emit(FetchAllProblemsSuccessState(problems: problems));
      },
    );
  }
}
