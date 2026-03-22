import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class GetShopProductsStates {}

final class GetShopProductsInitialState extends GetShopProductsStates {}

final class GetShopProductsLoadingState extends GetShopProductsStates {}

final class GetShopProductsSuccessState extends GetShopProductsStates {
  final List<HomeShopProductEntity> products;

  GetShopProductsSuccessState({required this.products});
}

final class GetShopProductsErrorState extends GetShopProductsStates {
  final String errorMsg;

  GetShopProductsErrorState({required this.errorMsg});
}
