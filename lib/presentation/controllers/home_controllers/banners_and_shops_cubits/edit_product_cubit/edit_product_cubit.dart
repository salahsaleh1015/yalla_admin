

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_product_cubit/edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductStates> {
  EditProductCubit(this.deleteShopProductUseCase) : super(EditProductInitialState());

 static EditProductCubit get(context)=>BlocProvider.of(context);

  EditShopProductUseCase deleteShopProductUseCase;
  Future<void> editProduct({
    required EditShopProductModelForDomain updatedProduct,
  }) async {
    emit(EditProductLoadingState());

    var result = await deleteShopProductUseCase.call(updatedProduct);

    result.fold(
          (failure) {
        emit(EditProductErrorState(errorMsg: failure.message));
      },
          (products) {
        emit(EditProductSuccessState());
      },
    );
  }
}
