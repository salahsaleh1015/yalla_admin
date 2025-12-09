

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_ads_dialoge.dart';
import 'package:yalla_admin/presentation/global_widgets/global_admin_add_button_widget.dart';

class AddAdsBar extends StatelessWidget {
  const AddAdsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "شركاء الاعلانات",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          GlobalAdminAddButtonWidget(
            text: "إضافة شريك الإعلان",
            onTap: () {
              addAdsDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
