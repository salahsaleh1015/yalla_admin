import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_busy_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_busy_deliveries_cubit/fetch_busy_deliveries_state.dart';

class FetchBusyDeliveriesCubit extends Cubit<FetchBusyDeliveriesStates> {
  FetchBusyDeliveriesCubit(
    this.fetchBusyDeliveriesUseCase,

  ) : super(FetchBusyDeliveriesInitialState());

  static FetchBusyDeliveriesCubit get(context) => BlocProvider.of(context);

  FetchBusyDeliveriesUseCase fetchBusyDeliveriesUseCase;


  Future<void> fetchBusyDeliveries() async {
    emit(FetchBusyDeliveriesLoadingState());

    var result = await fetchBusyDeliveriesUseCase.call();

    result.fold(
      (failure) {
        emit(FetchBusyDeliveriesErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(
          FetchBusyDeliveriesSuccessState(busyDeliveries: deliveries),
        );
      },
    );
  }


}
