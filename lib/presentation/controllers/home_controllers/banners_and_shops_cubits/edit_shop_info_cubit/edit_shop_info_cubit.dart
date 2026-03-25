

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_details_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_shop_info_cubit/edit_shop_info_state.dart';

class EditShopInfoCubit extends Cubit<EditShopInfoStates> {
  EditShopInfoCubit(this.editShopInfoUseCase) : super(EditShopInfoInitialState());

 static EditShopInfoCubit get(context)=>BlocProvider.of(context);

  EditShopInfoUseCase editShopInfoUseCase;

  Future<void> editShopInfo({
    required EditShopInfoModelForDomain updatedProductInfo,
  }) async {
    emit(EditShopInfoLoadingState());

    var result = await editShopInfoUseCase.call(updatedProductInfo);

    result.fold(
          (failure) {
        emit(EditShopInfoErrorState(errorMsg: failure.message));
      },
          (products) {
        emit(EditShopInfoSuccessState());
      },
    );
  }
}
