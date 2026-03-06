import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/counted_completed_orders_card.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/counted_deliveries_card.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/counted_users_card.dart';

class AdminStatisticsCardsList extends StatelessWidget {
  const AdminStatisticsCardsList({super.key});

  /// add model of statistics
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s130.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const CountedDeliveriesCard(),
          SizedBox(width: AppSize.s10.w),
          const CountedCompletedOrdersCard(),
          SizedBox(width: AppSize.s10.w),
          const CountedUsersCard(),
        ],
      ),
    );
  }
}
