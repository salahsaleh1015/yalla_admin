

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/add_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/add_delivery_cubit/add_delivery_state.dart';

class AddDeliveryCubit extends Cubit<AddDeliveryStates> {
  AddDeliveryCubit(this.addDeliveriesUseCase) : super(AddDeliveryInitialState());

  AddDeliveriesUseCase addDeliveriesUseCase;

 static AddDeliveryCubit get(context)=>BlocProvider.of(context);

  Future<void> addUnAvailableDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(AddDeliveryLoadingState());

    var result = await addDeliveriesUseCase.call(delivery);

    result.fold(
          (failure) {
        emit(AddDeliveryErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(AddDeliverySuccessState());
      },
    );
  }


}
