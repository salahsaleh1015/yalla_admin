


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_delivery_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_admin_add_button_widget.dart';


class AdminAddDeliveryBar extends StatelessWidget {
  const AdminAddDeliveryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: AppSize.s40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "جميع مندوبي التوصيل",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          GlobalAdminAddButtonWidget(
            text: "إضافة مندوب توصيل",
            onTap: () {
              addDeliveryDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
