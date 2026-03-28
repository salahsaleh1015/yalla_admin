
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_vendor_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/edit_vendor_info_dialog.dart';

class DropdownMenuModel {
  const DropdownMenuModel({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<DropdownMenuModel> firstItems = [
    editInfo,
    deleteVendor
  ];

  static const editInfo = DropdownMenuModel(text: 'تعديل المعلومات', icon: Icons.edit);

  static const deleteVendor =
  DropdownMenuModel(text: 'حذف موزع الخدمة', icon: FontAwesomeIcons.trash);

  static Widget buildItem(DropdownMenuModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.all(AppPadding.p2.r),
          child: CircleAvatar(
              backgroundColor: ColorManager.circleButtonColor,
              radius: AppSize.s25.r,
              child: Icon(item.icon, color: Colors.white, size: AppSize.s20.r)),
        ),
         SizedBox(
          width: AppSize.s10.w,
        ),
        Text(
          item.text,
          style:  TextStyle(
            color: ColorManager.black,
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, DropdownMenuModel item,{required DeleteShopModelForDomain deleteShopMadel}) {
    switch (item) {
      case MenuItems.editInfo:
        editVendorDialog(context,shopId: deleteShopMadel.shopId);
        break;
      case MenuItems.deleteVendor:
        deleteVendorDialog(context,deleteShopMadel: deleteShopMadel);
        break;
    }
  }
}


