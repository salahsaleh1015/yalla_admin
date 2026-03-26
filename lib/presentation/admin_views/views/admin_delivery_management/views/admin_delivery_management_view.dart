

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/admin_add_delivery_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_tab_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_tab_bar_view.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

import '../../../../../core/resources/constants_manager.dart';


class AdminDeliveryManagementView extends StatelessWidget {
  const AdminDeliveryManagementView({super.key});

  static String id = "AdminDeliveryManagementView";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstant.deliveryManagementTabBarLength,
      child: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "إدارة الديلفرات",
            style: Theme.of(context).textTheme.titleMedium,
          )),
          SizedBox(
            height: AppSize.s25.h,
          ),
          const DeliveryManagementTabBar(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const AdminAddDeliveryBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
          const DeliveryManagementTabBarView(),
        ],
      )),
    );
  }
}
