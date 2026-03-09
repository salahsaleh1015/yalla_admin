import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/data/repos/home_repo/home_statistics_cards_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_the_number_of_users_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_users_cubit/get_the_number_of_users_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/statistics_cards_cubits/get_the_number_of_users_cubit/get_the_number_of_users_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

class CountedUsersCard extends StatelessWidget {
  const CountedUsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTheNumberOfUsersCubit>(
      create:
          (context) => GetTheNumberOfUsersCubit(
            GetTheNumberOfUsersUseCase(getIt<HomeStatisticsCardsRepoImpl>()),
          )..getTheNumberUsers(),
      child: GlobalDecoratedContainer(
        width: AppSize.s120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.userIcon,
              width: AppSize.s25.w,
              height: AppSize.s25.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: AppSize.s5.h),
            BlocBuilder<
                GetTheNumberOfUsersCubit,
                GetTheNumberOfUsersStates
            >(
              builder: (context, state) {
                if (state is GetTheNumberOfUsersLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  );
                } else if (state is GetTheNumberOfUsersSuccessState) {
                  return Text(
                    state.usersNumber.toString(),
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
              "عدد المستخدمين",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
