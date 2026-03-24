
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_product_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_admin_add_button_widget.dart';


class AdminAddProductForShopBar extends StatelessWidget {
  const AdminAddProductForShopBar({super.key, required this.shopId});
final String shopId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "المنتجات المقدمة",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            GlobalAdminAddButtonWidget(
              text: "إضافة منتج جديد",
              onTap: () {
                Navigator.pushNamed(context, Routes.adminAddShopProductRoute,arguments: shopId);
                //addProductDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
