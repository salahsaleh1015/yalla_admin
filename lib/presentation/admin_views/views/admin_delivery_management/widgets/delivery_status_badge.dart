




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/data/models/status_badge_model.dart';

class DeliveryStatusBadge extends StatelessWidget {
  const DeliveryStatusBadge({
    super.key,
    required this.statusBadgeModel,
  });

 final StatusBadgeModel  statusBadgeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s70.w,
      height: AppSize.s33.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        color: statusBadgeModel.badgeBackgroundColor, //ColorManager.lightSecondary
      ),
      child: Center(
        child: Text(statusBadgeModel.deliveryStatus,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: statusBadgeModel.deliveryStatusColor)),
      ),
    );
  }
}
