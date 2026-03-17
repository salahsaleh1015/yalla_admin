
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/presentation/global_widgets/global_add_image_button.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';


class AdminVendorEmptyImage extends StatelessWidget {
  const AdminVendorEmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s150.h,
      width: double.infinity,
      color: ColorManager.arrowBackBackGroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: AppPadding.p40.h,
          left: AppPadding.p10.w,
          right: AppPadding.p10.w,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back,
                  iconColor: ColorManager.white,
                  circleColor: ColorManager.circleButtonColor,
                ),
                GlobalCircularButtonWidget(
                  onTap: () {
                    ///todo: add drop down menu
                  },
                  icon: Icons.more_vert_sharp,
                  iconColor: ColorManager.white,
                  circleColor: ColorManager.circleButtonColor,
                )
              ],
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
             Center(
              child: GlobalAddImageButton(
                onImageUploaded: (imageUrl) {
                  print("Image URL: $imageUrl");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}