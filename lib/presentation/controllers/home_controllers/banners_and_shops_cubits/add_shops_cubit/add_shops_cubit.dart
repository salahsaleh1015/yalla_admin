import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_shops_cubit/add_shops_state.dart';

class AddShopsCubit extends Cubit<AddShopsStates> {
  AddShopsCubit(this.addShopUseCase) : super(AddShopInitialState());

  static AddShopsCubit get(context) => BlocProvider.of(context);

  AddShopUseCase addShopUseCase;

  Future<void> addShop({required HomeShopEntity shop}) async {
    emit(AddShopLoadingState());

    var result = await addShopUseCase.call(shop);

    result.fold(
      (failure) {
        emit(AddShopErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(AddShopSuccessState());
      },
    );
  }
}
