
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/utils/get_status_badge_color.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_status_badge.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_order_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_divider_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_secondary_button.dart';

import '../../../../core/resources/font_manager.dart';


Future<void> orderDetailsForAdminDialog(BuildContext context,
    {required OrderEntity order,}) {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.white,
          contentPadding: EdgeInsets.all(AppPadding.p8.r),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تفاصيل طلب",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: FontSize.s22),
                    ),
                    SizedBox(
                      width: AppSize.s70.w,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManager.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                OrderStatusBadge(
                  statusColor: getStatusBadgeColor(order.orderStatus),
                  orderStatus: order.orderStatus,
                  orderStatusColor: getStatusTextColor(order.orderStatus),
                ),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                const GlobalDividerWidget(),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                 OrderDetailsContentForAdminDialog(
                  order: order,
                ),
                TextButton(
                    onPressed: () {
                      deleteOrderDialog(context ,orderId: order.orderId);
                    },
                    child: Text(
                      "هل تريد حذف هذا الطلب؟",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorManager.error),
                    )),
              ],
            ),
          ),
          actions: [
            GlobalSecondaryButton(
                width: MediaQuery.of(context).size.width,
                text: "إغلاق",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        );
      });
}

class OrderDetailsContentForAdminDialog extends StatelessWidget {
  const OrderDetailsContentForAdminDialog({super.key, required this.order});
 final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p12.w,
        vertical: AppPadding.p16.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          color: ColorManager.scaffoldBackgroundColor,
          border: Border.all(
            color: ColorManager.socialButtonColor,
            width: AppSize.s1.w,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "المستخدم: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                order.userName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          buildSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "مندوب التوصيل: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                order.deliveryName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          buildSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الموزع: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "------",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          buildSpacer(),
          Text(
            "عنوان المستخدم:",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorManager.darkGrayColor),
          ),
          SizedBox(
            height: AppSize.s5.h,
          ),
          Text(
           order.userLocation,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          buildSpacer(),
          Text(
            "تفاصيل الطلب:",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorManager.darkGrayColor),
          ),
          SizedBox(
            height: AppSize.s5.h,
          ),
          Text(
            order.orderDetails,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          buildSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "إجمالي السعر:",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                " الدفع عند الاستلام ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          buildSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الوقت: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
               order.orderRequestTime,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSpacer() {
    return Column(
      children: [
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalDividerWidget(),
        SizedBox(
          height: AppSize.s10.h,
        ),
      ],
    );
  }
}
