import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_accepted_orders_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_accepted_orders_cubit/fetch_accepted_orders_state.dart';

class FetchAcceptedOrdersCubit extends Cubit<FetchAcceptedOrdersStates> {
  FetchAcceptedOrdersCubit(this.fetchAcceptedOrdersUseCase)
    : super(FetchAcceptedOrdersInitialState());

  FetchAcceptedOrdersUseCase fetchAcceptedOrdersUseCase;

  static FetchAcceptedOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchAcceptedOrders() async {
    emit(FetchAcceptedOrdersLoadingState());
    var result = await fetchAcceptedOrdersUseCase.call();
    result.fold(
      (failure) {
        emit(FetchAcceptedOrdersErrorState(errorMsg: failure.toString()));
      },
      (orders) {
        emit(FetchAcceptedOrdersSuccessState(acceptedOrders: orders));
      },
    );
  }
}
