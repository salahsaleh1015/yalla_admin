
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_secondary_decorated_container.dart';


class GlobalVendorItemWidget extends StatelessWidget {
  const GlobalVendorItemWidget({super.key,  this.width, this.height, required this.shop, });
  final double? height;
  final double? width;
  final HomeShopEntity shop;


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
          child: Image.network(
              fit: BoxFit.fill,
              width:width?? AppSize.s250.w,
              height:height?? AppSize.s160.h,
              shop.shopImage),
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
                       shop.shopName,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        shop.shopRate.toString(),
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
                        shop.shopAddress,
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
                    onTap: (){
                      Navigator.pushNamed(context, Routes.adminVendorDetailsRoute);
                    },
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
