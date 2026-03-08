import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/data/repos/home_repo/home_statistics_cards_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_the_number_of_deliveries_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_deliveries_cubit/get_the_number_of_deliveries_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_deliveries_cubit/get_the_number_of_deliveries_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';

class CountedDeliveriesCard extends StatelessWidget {
  const CountedDeliveriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTheNumberOfDeliveriesCubit>(
      create:
          (context) => GetTheNumberOfDeliveriesCubit(
            GetTheNumberOfDeliveriesUseCase(
              getIt<HomeStatisticsCardsRepoImpl>(),
            ),
          )..getTheNumberDeliveries(),
      child: GlobalDecoratedContainer(
        width: AppSize.s120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.vehicleIcon,
              width: AppSize.s25.w,
              height: AppSize.s25.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: AppSize.s5.h),
            BlocBuilder<
              GetTheNumberOfDeliveriesCubit,
              GetTheNumberOfDeliveriesStates
            >(
              builder: (context, state) {
                if (state is GetTheNumberOfDeliveriesLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  );
                } else if (state is GetTheNumberOfDeliveriesSuccessState) {
                  return Text(
                    state.deliveriesNumber.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.primary,
                    ),
                  );
                } else {
                  return Icon(
                    Icons.error_outline,
                    color: ColorManager.darkGrayColor,
                    size: AppSize.s25.r,
                  );
                }
              },
            ),
            SizedBox(height: AppSize.s5.h),
            Text(
              "عدد الديلفرات المسجلين",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
