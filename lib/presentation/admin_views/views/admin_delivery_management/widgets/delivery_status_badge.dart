




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class DeliveryStatusBadge extends StatelessWidget {
  const DeliveryStatusBadge({
    super.key,
    required this.statusColor,
    required this.deliveryStatus,
    required this.deliveryStatusColor,
  });

  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
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
        child: Text(deliveryStatus,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: deliveryStatusColor)),
      ),
    );
  }
}
