import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_available_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_available_deliveries_cubit/fetch_available_deliveries_state.dart';

class FetchAvailableDeliveriesCubit
    extends Cubit<FetchAvailableDeliveriesStates> {
  FetchAvailableDeliveriesCubit(this.fetchAvailableDeliveriesUseCase)
    : super(FetchAvailableDeliveriesInitialState());

  static FetchAvailableDeliveriesCubit get(context) => BlocProvider.of(context);

  FetchAvailableDeliveriesUseCase fetchAvailableDeliveriesUseCase;

  Future<void> fetchAvailableDeliveries() async {
    emit(FetchAvailableDeliveriesLoadingState());

    var result = await fetchAvailableDeliveriesUseCase.call();

    result.fold(
      (failure) {
        emit(FetchAvailableDeliveriesErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(
          FetchAvailableDeliveriesSuccessState(availableDeliveries: deliveries),
        );
      },
    );
  }
}
