

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_details_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_shop_cubit/delete_shop_state.dart';

class DeleteShopCubit extends Cubit<DeleteShopStates> {
  DeleteShopCubit(this.deleteShopUseCase) : super(DeleteShopInitialState());

 static DeleteShopCubit get(context)=>BlocProvider.of(context);

  DeleteShopUseCase deleteShopUseCase;

  Future<void> deleteShop({
    required DeleteShopModelForDomain deleteShopMadel,
  }) async {
    emit(DeleteShopLoadingState());

    var result = await deleteShopUseCase.call(deleteShopMadel);

    result.fold(
          (failure) {
        emit(DeleteShopErrorState(errorMsg: failure.message));
      },
          (products) {
        emit(DeleteShopSuccessState());
      },
    );
  }
}
