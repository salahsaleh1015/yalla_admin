import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/add_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch__unavailable_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_unavailable_deliveries_cubit/fetch_unavailable_deliveries_state.dart';

class FetchUnavailableDeliveriesCubit
    extends Cubit<FetchUnavailableDeliveriesStates> {
  FetchUnavailableDeliveriesCubit(
    this.fetchUnAvailableDeliveriesUseCase,


  ) : super(FetchUnavailableDeliveriesInitialState());

  FetchUnAvailableDeliveriesUseCase fetchUnAvailableDeliveriesUseCase;




  static FetchUnavailableDeliveriesCubit get(context) =>
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






}
