
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class ShopInfoItemWidget extends StatelessWidget {
  const ShopInfoItemWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "ابن ابلد",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacer(),
              Icon(
                Icons.star,
                color: ColorManager.activeRateColor,
                size: AppSize.s25.r,
              ),
              SizedBox(
                width: AppSize.s5.w,
              ),
              Text(
                "4.0/5.0",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: AppSize.s25.r,
                color: ColorManager.darkGrayColor,
              ),
              SizedBox(
                width: AppSize.s5.w,
              ),
              Text(
                "مدينة 6 أكتوبر, محافظة الجيزة",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                size: AppSize.s25.r,
                color: ColorManager.darkGrayColor,
              ),
              SizedBox(
                width: AppSize.s5.w,
              ),
              Text(
                "+20 113 222 4343",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: AppSize.s30.w,
              ),
              // Icon(
              //   Icons.timer_rounded,
              //   size: AppSize.s25.r,
              //   color: ColorManager.darkGrayColor,
              // ),
              // SizedBox(
              //   width: AppSize.s5.w,
              // ),
              // Text(
              //   "مفتوح 10 صباحًا - 2 صباحًا",
              //   style: Theme.of(context).textTheme.labelMedium,
              // )
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
        ],
      ),
    );
  }
}