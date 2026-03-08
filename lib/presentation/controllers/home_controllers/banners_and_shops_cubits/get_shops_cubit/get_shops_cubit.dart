import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_shops_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shops_cubit/get_shops_state.dart';


class GetShopsCubit extends Cubit<GetShopsStates> {
  GetShopsCubit(this.getShopsUseCase) : super(GetShopsInitialState());

  static GetShopsCubit get(context) => BlocProvider.of(context);

  GetShopsUseCase getShopsUseCase;

  Future<void> fetchShops() async {
    emit(GetShopsLoadingState());
    var result = await getShopsUseCase.call();
    result.fold((failure) {
      emit(GetShopsErrorState(errorMessage: failure.message));
    }, (shops) {
      emit(GetShopsLoadedState(shops: shops));
    });
  }
}