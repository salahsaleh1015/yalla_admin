import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shop_products_cubit/get_shop_products_state.dart';

class GetShopProductsCubit extends Cubit<GetShopProductsStates> {
  GetShopProductsCubit(this.getShopProductsUseCase)
    : super(GetShopProductsInitialState());

  static GetShopProductsCubit get(context) => BlocProvider.of(context);

  GetProductsUseCase getShopProductsUseCase;

  Future<void> fetchProducts(String id) async {
    emit(GetShopProductsLoadingState());
    var result = await getShopProductsUseCase.call(id);
    result.fold(
      (failure) {
        emit(GetShopProductsErrorState(errorMsg: failure.message));
      },
      (products) {
        emit(GetShopProductsSuccessState(products: products));
      },
    );
  }
}
