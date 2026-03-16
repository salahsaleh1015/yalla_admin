
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/delete_delivery_cubit/delete_delivery_state.dart';

class DeleteDeliveryCubit extends Cubit<DeleteDeliveryStates> {
  DeleteDeliveryCubit(this.deleteDeliveriesUseCase) : super(DeleteDeliveryInitialState());

  DeleteDeliveriesUseCase deleteDeliveriesUseCase;


 static DeleteDeliveryCubit get(context)=>BlocProvider.of(context);


  Future<void> deleteUnAvailableDeliveries({required String deliveryId}) async {
    emit(DeleteDeliveryLoadingState());

    var result = await deleteDeliveriesUseCase.call(deliveryId);

    result.fold(
          (failure) {
        emit(DeleteDeliveryErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(DeleteDeliverySuccessState());
      },
    );
  }
}
