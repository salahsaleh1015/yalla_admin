

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/delete_order_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/delete_order_cubit/delete_order_state.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderStates> {
  DeleteOrderCubit(this.deleteOrderUseCase) : super(DeleteOrderInitialState());
  DeleteOrderUseCase deleteOrderUseCase;

  static DeleteOrderCubit get(context)=>BlocProvider.of(context);

  void deleteOrder({required String orderId}) async {
    emit(DeleteOrderLoadingState());

    var result = await deleteOrderUseCase.call(orderId);

    result.fold(
          (failure) {
        emit(DeleteOrderErrorState(errorMsg: failure.message));
      },
          (orders) {
        emit(DeleteOrderSuccessState());
      },
    );
  }

}
