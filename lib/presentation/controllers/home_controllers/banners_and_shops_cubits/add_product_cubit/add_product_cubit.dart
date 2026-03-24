import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_product_cubit/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit(this.addShopProductUseCase) : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);

  AddProductUseCase addShopProductUseCase;

  Future<void> addProduct({
    required AddShopProductModelForDomain addProduct,
  }) async {
    emit(AddProductLoadingState());

    var result = await addShopProductUseCase.call(addProduct);

    result.fold(
      (failure) {
        emit(AddProductErrorState(errorMsg: failure.message));
      },
      (products) {
        emit(AddProductSuccessState());
      },
    );
  }
}
