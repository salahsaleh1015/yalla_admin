import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_cancelled_orders_usecae.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_cancelled_orders_cubit/fetch_cancelled_orders_state.dart';

class FetchCancelledOrdersCubit extends Cubit<FetchCancelledOrdersStates> {
  FetchCancelledOrdersCubit(this.fetchCancelledOrdersUseCase)
    : super(FetchCancelledOrdersInitialState());
  FetchCancelledOrdersUseCase fetchCancelledOrdersUseCase;

  static  FetchCancelledOrdersCubit  get(context)=>BlocProvider.of(context);


  Future<void> fetchCancelledOrders() async {
    emit(FetchCancelledOrdersLoadingState());

    var result = await fetchCancelledOrdersUseCase.call();
    result.fold(
          (failure) {
        emit(FetchCancelledOrdersErrorState(errorMsg: failure.toString()));
      },
          (orders) {
        emit(FetchCancelledOrdersSuccessState(cancelledOrders: orders));
      },
    );
  }
}
