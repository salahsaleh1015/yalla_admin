

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_all_orders_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_all_orders_cubit/fetch_all_orders_state.dart';

class FetchAllOrdersCubit extends Cubit<FetchAllOrdersStates> {
  FetchAllOrdersCubit(this.fetchAllOrdersUseCase) : super(FetchAllOrdersInitialState());

  static FetchAllOrdersCubit  get(context)=>BlocProvider.of(context);

  FetchAllOrdersUseCase fetchAllOrdersUseCase;

  Future<void> fetchAllOrders() async {
    emit(FetchAllOrdersLoadingState());

    var result = await fetchAllOrdersUseCase.call();
    result.fold(
          (failure) {
        emit(FetchAllOrdersErrorState(errorMsg: failure.toString()));
      },
          (orders) {
        emit(FetchAllOrdersSuccessState(allOrders: orders));
      },
    );
  }
}
