
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/data/repos/home_repo/home_banners_and_shops_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_shops_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shops_cubit/get_shops_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_shops_cubit/get_shops_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_vendor_item_widget.dart';

import '../../../../core/resources/routes_manager.dart';

import '../../core/resources/values_manager.dart';

class GlobalVendorListWidget extends StatelessWidget {
  const GlobalVendorListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetShopsCubit>(
      create: (context) => GetShopsCubit(
        GetShopsUseCase(getIt.get<HomeBannersAndShopsRepoImpl>()),
      )..fetchShops(),
      child: BlocBuilder<GetShopsCubit, GetShopsStates>(
        builder: (context, state) {
          var cubit = GetShopsCubit.get(context);
          if (state is GetShopsLoadingState) {
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is GetShopsErrorState) {
            return Center(
              child: Text(
                // "حدث خطا من فضلك حاول مرة اخرى",
                "حدث خطا من فضلك حاول مرة اخرى",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          } else if(state is GetShopsLoadedState){
            return SizedBox(
              width: double.infinity,
              height: AppSize.s408.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: AppSize.s10.w,
                  ),
                  itemCount: state.shops.length,
                  itemBuilder: (context, index) {
                    // var shop = ShopModel(
                    //   shopId:  cubit.shopsList[index].shopId,
                    //     shopName: cubit.shopsList[index].shopName,
                    //     shopAddress: cubit.shopsList[index].shopAddress,
                    //     shopPhoneNumber: cubit.shopsList[index].shopPhoneNumber,
                    //     shopImage: AssetsManager.shopTest,
                    //     shopRate: cubit.shopsList[index].shopRate);
                    return GlobalVendorItemWidget(

                     // shop: state.shops[index],
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.shopDetailsRoute,
                        //     arguments:
                        //     state.shops[index]
                        // );
                      },
                    );
                  }
              ),
            );
          }else{
            return Center(
                child: Text(
                  "لا يوجد اعلانات",
                  style: Theme.of(context).textTheme.headlineSmall,
                ));
          }
        },
      ),
    );
  }
}