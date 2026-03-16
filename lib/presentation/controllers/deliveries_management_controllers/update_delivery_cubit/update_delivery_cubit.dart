import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/update_delivery_cubit/update_delivery_state.dart';

class UpdateDeliveryCubit extends Cubit<UpdateDeliveryStates> {
  UpdateDeliveryCubit(this.updateDeliveriesUseCase)
    : super(UpdateDeliveryInitialState());
  UpdateDeliveriesUseCase updateDeliveriesUseCase;

 static UpdateDeliveryCubit get(context)=>BlocProvider.of(context);


  Future<void> updateDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(UpdateDeliveryLoadingState());

    var result = await updateDeliveriesUseCase.call(delivery);

    result.fold(
          (failure) {
        emit(UpdateDeliveryErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(UpdateDeliverySuccessState());
      },
    );
  }
}
