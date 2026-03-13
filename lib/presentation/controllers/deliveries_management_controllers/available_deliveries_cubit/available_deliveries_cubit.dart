import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_available_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/available_deliveries_cubit/available_deliveries_state.dart';

class AvailableDeliveriesCubit extends Cubit<AvailableDeliveriesStates> {
  AvailableDeliveriesCubit(
      this.fetchAvailableDeliveriesUseCase,
      this.deleteDeliveriesUseCase,
      this.updateDeliveriesUseCase
      ) : super(AvailableDeliveriesInitialState());

  static AvailableDeliveriesCubit get(context) => BlocProvider.of(context);


  FetchAvailableDeliveriesUseCase fetchAvailableDeliveriesUseCase;
  DeleteDeliveriesUseCase deleteDeliveriesUseCase;
  UpdateDeliveriesUseCase updateDeliveriesUseCase;



  Future<void> fetchAvailableDeliveries() async {
    emit(FetchAvailableDeliveriesLoadingState());

    var result = await fetchAvailableDeliveriesUseCase.call();

    result.fold(
          (failure) {
        emit(FetchAvailableDeliveriesErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(
          FetchAvailableDeliveriesSuccessState(
            availableDeliveries: deliveries,
          ),
        );
      },
    );
  }



  Future<void> deleteAvailableDeliveries({required String deliveryId}) async {
    emit(DeleteAvailableDeliveryLoadingState());

    var result = await deleteDeliveriesUseCase.call(deliveryId);

    result.fold(
          (failure) {
        emit(DeleteAvailableDeliveryErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(DeleteAvailableDeliverySuccessState());
      },
    );
  }
  Future<void> updateAvailableDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(UpdateAvailableDeliveryLoadingState());

    var result = await updateDeliveriesUseCase.call(delivery);

    result.fold(
          (failure) {
        emit(UpdateAvailableDeliveryErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(UpdateAvailableDeliverySuccessState());
      },
    );
  }




}
