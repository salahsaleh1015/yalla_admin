
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/models/admin_drop_down_menu_model.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';

import '../../../../../core/resources/assets_manager.dart';

class AdminVendorImageItem extends StatelessWidget {
  const AdminVendorImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s150.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(AssetsManager.shopTest),
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
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(

                items: [
                  ...MenuItems.firstItems.map(
                    (item) => DropdownMenuItem<DropdownMenuModel>(
                      value: item,
                      child: MenuItems.buildItem(item),
                    ),
                  ),
                ],
                menuItemStyleData:  MenuItemStyleData(

                  padding: EdgeInsets.only(left: AppPadding.p16.w, right: AppPadding.p16.w),
                ),
                onChanged: (value) {
                  MenuItems.onChanged(context, value!);
                },
                dropdownStyleData: DropdownStyleData(
                  width:AppSize.s250.w,
                  padding:  EdgeInsets.symmetric(vertical: AppPadding.p16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s25.r),
                    color: ColorManager.white,
                  ),
                  offset: const Offset(0, 8),
                ),
                customButton:  CircleAvatar(
                  backgroundColor: ColorManager.circleButtonColor,
                  radius: AppSize.s25.r,
                  child:  Icon(
                    Icons.more_vert_sharp,
                    size: AppSize.s25.r,
                    color: ColorManager.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

