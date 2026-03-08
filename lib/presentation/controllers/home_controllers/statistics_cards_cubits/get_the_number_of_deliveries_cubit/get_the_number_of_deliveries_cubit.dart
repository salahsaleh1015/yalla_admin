import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_the_number_of_deliveries_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_deliveries_cubit/get_the_number_of_deliveries_state.dart';

class GetTheNumberOfDeliveriesCubit
    extends Cubit<GetTheNumberOfDeliveriesStates> {
  GetTheNumberOfDeliveriesCubit(this.getTheNumberOfDeliveriesUseCase)
    : super(GetTheNumberOfDeliveriesInitialState());
  final GetTheNumberOfDeliveriesUseCase getTheNumberOfDeliveriesUseCase;

  static GetTheNumberOfDeliveriesCubit get(context) => BlocProvider.of(context);

  Future<void> getTheNumberDeliveries() async {
    emit(GetTheNumberOfDeliveriesLoadingState());
    var result = await getTheNumberOfDeliveriesUseCase.call();
    result.fold(
      (failure) {
        emit(
          GetTheNumberOfDeliveriesErrorState(errorMessage: failure.toString()),


        );

        debugPrint("///////////////////");
        debugPrint(failure.toString());
      },
      (deliveriesNumber) {
        emit(
          GetTheNumberOfDeliveriesSuccessState(
            deliveriesNumber: deliveriesNumber,
          ),
        );
      },
    );
  }
}
