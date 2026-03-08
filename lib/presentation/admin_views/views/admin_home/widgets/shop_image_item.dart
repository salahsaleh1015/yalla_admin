
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';

import '../../../../../../../core/utils/constants.dart';


class ShopImageItem extends StatelessWidget {
  const ShopImageItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s150.h,
      width: double.infinity,
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10.w,
          vertical: AppPadding.p50.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalCircularButtonWidget(
              onTap: () async {
               // await clearHiveBox<HomeShopProductEntity>(boxName: kProductsBox);
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            ),

            SizedBox(
              width: AppSize.s10.w,
            )
            // GlobalCircularButtonWidget(
            //   onTap: () {
            //    // Navigator.pushNamed(context, CartView.id);
            //   },
            //   icon: Icons.shopping_cart_sharp,
            //   iconColor: ColorManager.white,
            //   circleColor: ColorManager.circleButtonColor,
            // )
          ],
        ),
      ),
    );
  }
}