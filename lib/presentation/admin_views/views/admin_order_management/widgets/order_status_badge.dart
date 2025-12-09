






import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    super.key,
    required this.statusColor,
    required this.orderStatus,
    required this.orderStatusColor,
  });

  final Color statusColor;
  final String orderStatus;
  final Color orderStatusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s70.w,
      height: AppSize.s33.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        color: statusColor, //ColorManager.lightSecondary
      ),
      child: Center(
        child: Text(orderStatus,style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: orderStatusColor
        )),
      ),
    );
  }
}