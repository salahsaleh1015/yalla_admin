
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/adds_bars.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_statistics_cards_list.dart';
import 'package:yalla_admin/presentation/global_widgets/global_advertisement_list_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_vendor_list_widget.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});
  static String id = "AdminHomeView";
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminMainBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
          SizedBox(
            height: AppSize.s20.h,
            child: Text("الإحصائيات المختصرة",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const AdminStatisticsCardsList(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const AddAdsBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
           const GlobalAdvertisementListWidget(),
          AddShopsBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
        const GlobalVendorListWidget(),
        ],
      ),
    ));
  }
}