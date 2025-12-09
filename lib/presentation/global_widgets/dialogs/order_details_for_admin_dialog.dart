
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_status_badge.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_order_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_divider_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_secondary_button.dart';

import '../../../../core/resources/font_manager.dart';


Future<void> orderDetailsForAdminDialog(BuildContext context,
    {required String orderStatus,
    required Color statusColor,
    required Color orderStatusColor}) {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.white,
          contentPadding: EdgeInsets.all(AppPadding.p8.r),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تفاصيل طلب رقم #50",
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
                  statusColor: statusColor,
                  orderStatus: orderStatus,
                  orderStatusColor: orderStatusColor),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const GlobalDividerWidget(),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const OrderDetailsContentForAdminDialog(),
              TextButton(
                  onPressed: () {
                    deleteOrderDialog(context);
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
  const OrderDetailsContentForAdminDialog({super.key});

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
                "محمد علي",
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
                "محمد سعيد",
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
                "ابن البلد",
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
            "مدينة 6 اكتوبر , جامع الحصري الكافية الي جنب روستو",
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
            "2 X دجاج هارت اتاك سنجل",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "1 X ساعة ذكية رياضية",
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
                "200 ج.م",
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
                "09:33 م",
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
