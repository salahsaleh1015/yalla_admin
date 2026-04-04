
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';

class ShopInfoItemWidget extends StatelessWidget {
  const ShopInfoItemWidget({super.key, required this.shop, });

  final HomeShopEntity shop;
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
                shop.shopName,
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
               shop.shopRate.toString(),
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
              Expanded(
                child: Text(
                  shop.shopAddress,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
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
               shop.shopPhoneNumber,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: AppSize.s30.w,
              ),

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