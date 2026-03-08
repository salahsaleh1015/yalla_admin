import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_the_number_of_completed_orders_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_completed_orders_cubit/get_the_number_of_completed_orders_state.dart';

class GetTheNumberOfCompletedOrdersCubit
    extends Cubit<GetTheNumberOfCompletedOrdersStates> {
  GetTheNumberOfCompletedOrdersCubit(this.getTheNumberOfCompletedOrdersUseCase)
    : super(GetTheNumberOfCompletedOrdersInitialState());

  final GetTheNumberOfCompletedOrdersUseCase
  getTheNumberOfCompletedOrdersUseCase;

  static GetTheNumberOfCompletedOrdersCubit get(context) =>
      BlocProvider.of(context);

  Future<void> getTheNumberOfCompletedOrders() async {
    emit(GetTheNumberOfCompletedOrdersLoadingState());
    var result = await getTheNumberOfCompletedOrdersUseCase.call();
    result.fold(
      (failure) {
        emit(
          GetTheNumberOfCompletedOrdersErrorState(errorMsg: failure.toString()),
        );
      },
      (orders) {
        emit(GetTheNumberOfCompletedOrdersSuccessState(ordersNumber: orders));
      },
    );
  }
}
