
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_quick_add/widgets/addition_tab_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_quick_add/widgets/admin_add_delivery_body_widget.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_quick_add/widgets/admin_add_shop_body_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

class AdminAdditionView extends StatelessWidget {
  const AdminAdditionView({super.key});

  static const String id = 'AdminAdditionView';

  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                "اضافات سريعة",
                style: Theme.of(context).textTheme.titleMedium,
              )),
              SizedBox(
                height: AppSize.s50.h,
              ),
              const AdditionTabBar(),
              SizedBox(
                height: AppSize.s30.h,
              ),
              SizedBox(
                height: AppSize.s800,
                width: MediaQuery.of(context).size.width,
                child: const TabBarView(children: [
                  AdminAddShopBodyWidget(),
                  AdminAddDeliveryBodyWidget(),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
