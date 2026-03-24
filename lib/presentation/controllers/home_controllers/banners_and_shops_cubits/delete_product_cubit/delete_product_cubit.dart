

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_product_cubit/delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductStates> {
  DeleteProductCubit(this.deleteShopProductUseCase) : super(DeleteProductInitialState());

 static DeleteProductCubit get(context)=>BlocProvider.of(context);

  DeleteShopProductUseCase deleteShopProductUseCase;
  Future<void> deleteProduct({
    required DeleteShopProductModelForDomain deleteProduct,
  }) async {
    emit(DeleteProductLoadingState());

    var result = await deleteShopProductUseCase.call(deleteProduct);

    result.fold(
          (failure) {
        emit(DeleteProductErrorState(errorMsg: failure.message));
      },
          (products) {
        emit(DeleteProductSuccessState());
      },
    );
  }
}
