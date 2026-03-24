import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/data/repos/home_repo/home_details_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_product_item.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shop_products_cubit/get_shop_products_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shop_products_cubit/get_shop_products_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

class AdminProductsList extends StatelessWidget {
  const AdminProductsList({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider<GetShopProductsCubit>(
        create:
            (context) => GetShopProductsCubit(
              GetProductsUseCase(getIt.get<HomeDetailsTransactionsRepoImpl>()),
            )..fetchProducts(shopId),
        child: BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
          builder: (context, state) {
            return BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
              builder: (context, state) {
                var cubit = GetShopProductsCubit.get(context);
                if (state is GetShopProductsErrorState) {
                  return Center(child: Text(state.errorMsg));
                } else if (state is GetShopProductsLoadingState) {
                  return const Center(child: GlobalLoadingIndicator());
                } else if (state is GetShopProductsSuccessState) {
                  return state.products.isEmpty
                      ? NoData()
                      : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p10.w,
                          vertical: AppPadding.p10.h,
                        ),
                        itemCount: state.products.length,
                        itemBuilder:
                            (context, index) => AdminProductItem(
                              index: index,
                              shopId: shopId,
                              product: state.products[index],
                            ),
                      );
                } else {
                  return Center(
                    child: Text(
                      "لا يوجد منتجات",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
