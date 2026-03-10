

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_tab_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_tab_bar_view.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_search_card_item_widget.dart';

class AdminOrderManagementView extends StatelessWidget {
  const AdminOrderManagementView({super.key});
  static String id = "AdminOrderManagementView";
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
        child: DefaultTabController(
          length: AppConstant.managementTabBarLength,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                    "إدارة الطلبات",
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
              SizedBox(
                height: AppSize.s25.h,
              ),
              const AdminOrderManagementTabBar(),
              // SizedBox(
              //   height: AppSize.s25.h,
              // ),
              // const GlobalSearchCardItemWidget(hintText: "ابحث برقم الطلب"),
              SizedBox(
                height: AppSize.s30.h,
              ),
              Text("قائمة الطلبات", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const AdminOrderManagementTabBarView(),

            ],
          ),
        ));
  }
}


