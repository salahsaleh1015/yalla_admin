
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

class AdminStatisticsCard extends StatelessWidget {
  const AdminStatisticsCard(
      {super.key,
        required this.iconPath,
        required this.statisticsNumber,
        required this.statisticsTitle});
  final String iconPath;
  final int statisticsNumber;
  final String statisticsTitle;

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      width: AppSize.s120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            width: AppSize.s25.w,
            height: AppSize.s25.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: AppSize.s5.h,
          ),
          Text(statisticsNumber.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorManager.primary)),
          SizedBox(
            height: AppSize.s5.h,
          ),
          Text(statisticsTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
