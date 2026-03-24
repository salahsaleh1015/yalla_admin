import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_banners_cubit/get_banners_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_banners_cubit/get_banners_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_advertisement_item_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../core/services/dependency_injection_services/service_locator_setup.dart';
import 'no_data_widget.dart';

class GlobalAdvertisementListWidget extends StatelessWidget {
  const GlobalAdvertisementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetBannersCubit>(
      create:
          (context) => GetBannersCubit(
            GetBannersUseCase(getIt.get<HomeTransactionsRepoImpl>()),
          )..fetchBanners(),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s150.h,
        child: BlocBuilder<GetBannersCubit, GetBannersStates>(
          builder: (context, state) {
            var cubit = GetBannersCubit.get(context);
            if (state is GetBannersErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is GetBannersLoadingState) {
              return const Center(child: GlobalLoadingIndicator());
            } else if (state is GetBannersLoadedState) {
              return state.bannersList.isEmpty
                  ? NoData()
                  : ListView.separated(
                    separatorBuilder:
                        (context, index) => SizedBox(width: AppSize.s10.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.bannersList.length,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.adminBannerDetailsRoute,
                                arguments: state.bannersList[index]);
                          },
                          child: GlobalAdvertisementItemWidget(
                            title: state.bannersList[index].bannerShopName,
                            image: state.bannersList[index].bannerImage,
                          ),
                        ),
                  );
            } else {
              return Center(
                child: Text(
                  "لا يوجد اعلانات",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
