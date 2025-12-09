
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_product_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/edit_product_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';
import 'package:yalla_admin/presentation/global_widgets/global_light_button_widget.dart';

import '../../../../../../core/resources/values_manager.dart' ;
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p10.h),
      child: GlobalDecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  AssetsManager.productTest,
                  height: AppSize.s100.h,
                  width: AppSize.s130.w,
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    Text(
                      "دجاج هارت أتاك “سنجل”",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.primary),
                    ),
                    SizedBox(
                      height: AppSize.s5.h,
                    ),
                    Text(
                      "برجر دجاج مشوي مع إضافات مميزة.",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: AppSize.s5.h,
                    ),
                    Text(
                      "50 ج.م",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            GlobalButtonWidget(
              isButtonEnabled: true,
              text: "تعديل",
              onTap: () {
                editProductDialog(context);
              },
              width: MediaQuery.of(context).size.width,
              height: AppSize.s30.h,
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            GlobalLightButtonWidget(
                onTap: () {
                  deleteProductDialog(context);
                },
                width: MediaQuery.of(context).size.width,
                height: AppSize.s30.h,
                child: Text(
                  "حذف",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.error),
                ))
          ],
        ),
      ),
    );
  }
}
