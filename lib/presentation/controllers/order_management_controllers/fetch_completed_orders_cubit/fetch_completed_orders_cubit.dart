import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_completed_orders_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_completed_orders_cubit/fetch_completed_orders_state.dart';

class FetchCompletedOrdersCubit extends Cubit<FetchCompletedOrdersStates> {
  FetchCompletedOrdersCubit(this.fetchCompletedOrdersUseCase)
    : super(FetchCompletedOrdersInitialState());

  FetchCompletedOrdersUseCase fetchCompletedOrdersUseCase;

static FetchCompletedOrdersCubit   get(context)=>BlocProvider.of(context);

  Future<void> fetchCompletedOrders() async {
    emit(FetchCompletedOrdersLoadingState());
    var result = await fetchCompletedOrdersUseCase.call();
    result.fold(
          (failure) {
        emit(FetchCompletedOrdersErrorState(errorMsg: failure.toString()));
      },
          (orders) {
        emit(FetchCompletedOrdersSuccessState( completedOrders: orders));
      },
    );
  }
}
