import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/data/repos/home_repo/add_home_data_repo_impl.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_shop_products_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_product_item.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shop_products_cubit/get_shop_products_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shop_products_cubit/get_shop_products_state.dart';

class AdminProductsList extends StatelessWidget {
  const AdminProductsList({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider<GetShopProductsCubit>(
        create:
            (context) =>
        GetShopProductsCubit(
          GetShopProductsUseCase(getIt.get<HomeBannersAndShopsRepo>()),
        )
          ..fetchProducts(shopId),
        child: BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
          builder: (context, state) {

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p10.w,
                vertical: AppPadding.p10.h,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => const AdminProductItem(),
            );
          },
        ),
      ),
    );
  }
}
