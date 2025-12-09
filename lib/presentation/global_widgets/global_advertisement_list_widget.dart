
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_advertisement_item_widget.dart';

import '../../../../core/resources/routes_manager.dart';

class GlobalAdvertisementListWidget extends StatelessWidget {
  const GlobalAdvertisementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: AppSize.s150.h,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: AppSize.s10.w),
        scrollDirection: Axis.horizontal,
        itemCount:10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, Routes.bannerDetailsRoute,);
          },
          child: GlobalAdvertisementItemWidget(
            title:"هارت اتاك",
            image: "${AssetsManager.shopTest}",
          ),
        ),
      ),
    );
  }
}
