
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_status_badge.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_delivery_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/edit_delivery_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';
import 'package:yalla_admin/presentation/global_widgets/global_light_button_widget.dart';





class DeliveryManagementCard extends StatelessWidget {
  const DeliveryManagementCard({super.key, required this.statusColor, required this.deliveryStatus, required this.deliveryStatusColor});

  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(

        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s15.w, vertical: AppSize.s25.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "اسم المندوب : ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorManager.darkGrayColor),
                ),
                Text(
                  "محمد سعيد",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                DeliveryStatusBadge(
                  statusColor: statusColor,
                  deliveryStatus: deliveryStatus,
                  deliveryStatusColor: deliveryStatusColor,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "التقييم: ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorManager.darkGrayColor),
                ),
                RatingStars(
                  value: 5,
                  starCount: 5,
                  starSize: AppSize.s20.r,
                  starOffColor: ColorManager.inActiveRateColor,
                  starColor: ColorManager.activeRateColor,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "التليفون: ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorManager.darkGrayColor),
                ),
                Text(
                  "+20 111 222 3333",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "العنوان: ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorManager.darkGrayColor),
                ),
                Text(
                  "القاهرة",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlobalLightButtonWidget(
                  onTap: () {
                    deleteDeliveryDialog(context);
                  },
                  width: MediaQuery.of(context).size.width * 0.41,
                  height: AppSize.s33.h,
                  child: Text(
                    "حذف",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: ColorManager.error),
                  ),
                ),
                GlobalButtonWidget(
                  isButtonEnabled: true,
                  text: "تعديل",
                  onTap: () {
                    editDeliveryDialog(context);
                  },
                  width: MediaQuery.of(context).size.width * 0.41,
                  height: AppSize.s33.h,
                ),
              ],
            )
          ],
        ));
  }
}