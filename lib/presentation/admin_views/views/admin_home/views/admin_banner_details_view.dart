


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/font_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/shop_image_item.dart';

class BannerDetailsView extends StatelessWidget {
  const BannerDetailsView({super.key, required this.banner});

  final HomeBannerEntity banner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopImageItem(
            image: banner.bannerImage,

          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "ابن البلد",
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: FontSize.s26.sp
                      ),
                    ),
                    const Spacer(),
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
                      "مدينة 6 أكتوبر، محافظة الجيزة",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: FontSize.s20.sp
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
                      "+20 113 222 4343",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: FontSize.s20.sp
                      ),
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
          ),
          Divider(
            indent: AppSize.s20.w,
            endIndent: AppSize.s20.w,
            color: ColorManager.socialButtonColor,
          ),
          SizedBox(
            height: AppSize.s50.h,
          ),
          Center(
            child: Image.asset(AssetsManager.splashLogo, height:MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.8,),
          ),
        ],
      ),
    );
  }
}