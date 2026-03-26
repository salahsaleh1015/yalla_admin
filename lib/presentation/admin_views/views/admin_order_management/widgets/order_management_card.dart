import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/utils/get_status_badge_color.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_status_badge.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/order_details_for_admin_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_custom_animation_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

class OrderManagementCard extends StatelessWidget {
  const OrderManagementCard({
    super.key,
    required this.order,
    required this.orderIndex,
  });
  final OrderEntity order;
  final int orderIndex;
  @override
  Widget build(BuildContext context) {
    return GlobalCustomAnimationWidget(
      index: orderIndex,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppPadding.p10.h),
        child: GlobalDecoratedContainer(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p24.h,
            horizontal: AppPadding.p16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "رقم الطلب: ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.darkGrayColor,
                    ),
                  ),
                  Text(
                    orderIndex.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  OrderStatusBadge(
                    statusColor: getStatusBadgeColor(order.orderStatus),
                    orderStatus: order.orderStatus,
                    orderStatusColor: getStatusTextColor(order.orderStatus),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "المستخدم: ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.darkGrayColor,
                    ),
                  ),
                  Text(
                    order.userName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSize.s10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "مندوب التوصيل: ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.darkGrayColor,
                    ),
                  ),
                  Text(
                    order.deliveryName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSize.s10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "الوقت: ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.darkGrayColor,
                    ),
                  ),
                  Text(
                    order.orderRequestTime,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSize.s10.h),
              GlobalButtonWidget(
                isButtonEnabled: true,
                text: "عرض التفاصيل",
                onTap: () {
                  orderDetailsForAdminDialog(
                    context,


                    order: order,
                  );
                },
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
