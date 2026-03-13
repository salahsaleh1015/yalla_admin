import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_busy_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/busy_deliveries_cubit/busy_deliveries_state.dart';

class BusyDeliveriesCubit extends Cubit<BusyDeliveriesStates> {
  BusyDeliveriesCubit(
    this.fetchBusyDeliveriesUseCase,
    this.deleteDeliveriesUseCase,
    this.updateDeliveriesUseCase,
  ) : super(BusyDeliveriesInitialState());

  static BusyDeliveriesCubit get(context) => BlocProvider.of(context);

  FetchBusyDeliveriesUseCase fetchBusyDeliveriesUseCase;
  DeleteDeliveriesUseCase deleteDeliveriesUseCase;
  UpdateDeliveriesUseCase updateDeliveriesUseCase;

  Future<void> fetchBusyDeliveries() async {
    emit(FetchBusyDeliveriesLoadingState());

    var result = await fetchBusyDeliveriesUseCase.call();

    result.fold(
      (failure) {
        emit(FetchBusyDeliveriesErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(
          FetchBusyDeliveriesSuccessState(availableDeliveries: deliveries),
        );
      },
    );
  }

  Future<void> deleteBusyDeliveries({required String deliveryId}) async {
    emit(DeleteBusyDeliveryLoadingState());

    var result = await deleteDeliveriesUseCase.call(deliveryId);

    result.fold(
      (failure) {
        emit(DeleteBusyDeliveryErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(DeleteBusyDeliverySuccessState());
      },
    );
  }

  Future<void> updateBusyDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(UpdateBusyDeliveryLoadingState());

    var result = await updateDeliveriesUseCase.call(delivery);

    result.fold(
      (failure) {
        emit(UpdateBusyDeliveryErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(UpdateBusyDeliverySuccessState());
      },
    );
  }
}
