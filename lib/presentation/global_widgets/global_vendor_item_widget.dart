
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_secondary_decorated_container.dart';


class GlobalVendorItemWidget extends StatelessWidget {
  const GlobalVendorItemWidget({super.key,  this.width, this.height, required this.onTap,  });
  final double? height;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            topRight: Radius.circular(AppSize.s12.r),
          ),
          child: Image.asset(
              fit: BoxFit.fill,
              width:width?? AppSize.s250.w,
              height:height?? AppSize.s160.h,
              AssetsManager.shopTest),
        ),
        GlobalSecondaryDecoratedContainer(
          width:width?? AppSize.s250.w,
          height: height?? AppSize.s160.h,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                       "ابن البلد ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        "4.0/5.0",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Icon(
                        Icons.star,
                        color: ColorManager.activeRateColor,
                        size: AppSize.s25.r,
                      )
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
                      ),
                      SizedBox(
                        width: AppSize.s5.w,
                      ),
                      Text(
                        "مدينة 6 أكتوبر، محافظة الجيزة",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  GlobalButtonWidget(
                    isButtonEnabled: true,
                    width: double.infinity,
                    onTap: onTap,
                    text: "تفاصيل",
                  )
                ],
              ),
            )
        ),

      ],
    );
  }
}
