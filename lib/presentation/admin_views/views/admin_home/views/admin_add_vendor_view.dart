
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_admin_add_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_grid_vendor_list.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

import '../../../../global_widgets/dialogs/add_vendor_dialog.dart';

class AdminAddVendorView extends StatelessWidget {
  const AdminAddVendorView({super.key});
  static String id = "AdminAddVendorView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        children: [
          SizedBox(
            height: AppSize.s40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalCircularButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back),
                Text(
                  "موزعي الخدمة",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: AppSize.s30.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          SizedBox(
            height: AppSize.s40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "جميع موزعي الخدمة",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GlobalAdminAddButtonWidget(
                  text: "إضافة موزع خدمة جديد",
                  onTap: () {
                    addVendorDialog(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s15.h,
          ),
          GlobalGridVendorList(
            onTap: (){
              //Navigator.pushNamed(context, AdminVendorDetailsView.id);
            },
          )
        ],
      )),
    );
  }
}



