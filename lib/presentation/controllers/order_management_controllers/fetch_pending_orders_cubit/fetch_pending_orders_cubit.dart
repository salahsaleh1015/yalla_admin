

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_pending_orders_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_pending_orders_cubit/fetch_pending_orders_state.dart';

class FetchPendingOrdersCubit extends Cubit<FetchPendingOrdersStates> {
  FetchPendingOrdersCubit(this.fetchPendingOrdersUseCase) : super(FetchPendingOrdersInitialState());

  static FetchPendingOrdersCubit  get(context)=>BlocProvider.of(context);

  FetchPendingOrdersUseCase fetchPendingOrdersUseCase;

  Future<void> fetchAllOrders() async {
    emit(FetchPendingOrdersLoadingState());

    var result = await fetchPendingOrdersUseCase.call();
    result.fold(
          (failure) {
        emit(FetchPendingOrdersErrorState(errorMsg: failure.toString()));
      },
          (orders) {
        emit(FetchPendingOrdersSuccessState(allOrders: orders));
      },
    );
  }
}
