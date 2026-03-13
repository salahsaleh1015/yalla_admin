import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/add_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch__unavailable_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/unavailable_deliveries_cubit/unavailable_deliveries_state.dart';

class UnavailableDeliveriesCubit
    extends Cubit<UnavailableDeliveriesStates> {
  UnavailableDeliveriesCubit(
    this.fetchUnAvailableDeliveriesUseCase,
    this.deleteDeliveriesUseCase,
    this.updateDeliveriesUseCase,
    this.addDeliveriesUseCase,
  ) : super(UnavailableDeliveriesInitialState());

  FetchUnAvailableDeliveriesUseCase fetchUnAvailableDeliveriesUseCase;
  DeleteDeliveriesUseCase deleteDeliveriesUseCase;
  UpdateDeliveriesUseCase updateDeliveriesUseCase;
  AddDeliveriesUseCase addDeliveriesUseCase;

  static UnavailableDeliveriesCubit get(context) =>
      BlocProvider.of(context);

  Future<void> fetchUnAvailableDeliveries() async {
    emit(FetchUnavailableDeliveriesLoadingState());

    var result = await fetchUnAvailableDeliveriesUseCase.call();

    result.fold(
      (failure) {
        emit(FetchUnavailableDeliveriesErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(
          FetchUnavailableDeliveriesSuccessState(
            unAvailableDeliveries: deliveries,
          ),
        );
      },
    );
  }

  Future<void> deleteUnAvailableDeliveries({required String deliveryId}) async {
    emit(DeleteUnavailableDeliveryLoadingState());

    var result = await deleteDeliveriesUseCase.call(deliveryId);

    result.fold(
      (failure) {
        emit(DeleteUnavailableDeliveryErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(DeleteUnavailableDeliverySuccessState());
      },
    );
  }

  Future<void> addUnAvailableDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(AddUnavailableDeliveryLoadingState());

    var result = await addDeliveriesUseCase.call(delivery);

    result.fold(
      (failure) {
        emit(AddUnavailableDeliveryErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(AddUnavailableDeliverySuccessState());
      },
    );
  }

  Future<void> updateUnAvailableDeliveries({
    required DeliveryEntity delivery,
  }) async {
    emit(UpdateUnavailableDeliveryLoadingState());

    var result = await addDeliveriesUseCase.call(delivery);

    result.fold(
      (failure) {
        emit(UpdateUnavailableDeliveryErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(UpdateUnavailableDeliverySuccessState());
      },
    );
  }
}
