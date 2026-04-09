import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/delete_usecases.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_problem_cubit/delete_problem_state.dart';

class DeleteProblemCubit extends Cubit<DeleteProblemStates> {
  DeleteProblemCubit(this.deleteProblemUseCase)
    : super(DeleteProblemInitialState());
  DeleteProblemUseCase deleteProblemUseCase;
  static DeleteProblemCubit get(context) => BlocProvider.of(context);

  Future<void> deleteProblem({required String problemId}) async {
    emit(DeleteProblemLoadingState());

    var result = await deleteProblemUseCase.call(problemId);

    result.fold(
      (failure) {
        emit(DeleteProblemErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(DeleteProblemSuccessState());
      },
    );
  }
}
