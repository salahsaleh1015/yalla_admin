import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

class CountedCompletedOrdersCard extends StatelessWidget {
  const CountedCompletedOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      width: AppSize.s120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AssetsManager.checkMarkIcon,
            width: AppSize.s25.w,
            height: AppSize.s25.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: AppSize.s5.h),
          Text(
            12.toString(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: ColorManager.primary),
          ),
          SizedBox(height: AppSize.s5.h),
          Text(
            "عدد الطلبات المكتملة",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
    ;
  }
}
