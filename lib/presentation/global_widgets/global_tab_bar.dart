
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalTabBar extends StatelessWidget {
  const GlobalTabBar({super.key, required this.tabs});

  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
      child: Container(
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.socialButtonColor,
            width: AppSize.s2.w,
          ),
          color: ColorManager.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppSize.s50.r),
        ),
        child: TabBar(
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorManager.socialButtonColor),
          indicatorColor: ColorManager.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: ColorManager.lightPrimary,
            borderRadius: BorderRadius.circular(AppSize.s50.r),
          ),
          tabs: tabs,
        ),
      ),
    );
  }
}
