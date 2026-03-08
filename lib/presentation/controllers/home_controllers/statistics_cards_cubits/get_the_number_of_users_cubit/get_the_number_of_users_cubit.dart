import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_the_number_of_users_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_users_cubit/get_the_number_of_users_state.dart';

class GetTheNumberOfUsersCubit extends Cubit<GetTheNumberOfUsersStates> {
  GetTheNumberOfUsersCubit(this.getTheNumberOfUsersUseCase)
    : super(GetTheNumberOfUsersInitialState());
  final GetTheNumberOfUsersUseCase getTheNumberOfUsersUseCase;

  static GetTheNumberOfUsersCubit get(context) => BlocProvider.of(context);

  Future<void> getTheNumberUsers() async {
    emit(GetTheNumberOfUsersLoadingState());
    var result = await getTheNumberOfUsersUseCase.call();
    result.fold(
      (failure) {
        emit(GetTheNumberOfUsersErrorState(errorMsg: failure.toString()));
      },
      (usersNumber) {
        emit(GetTheNumberOfUsersSuccessState(usersNumber: usersNumber));
      },
    );
  }
}
