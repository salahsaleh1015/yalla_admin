
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_advertisement_item_widget.dart';

class GlobalAdvertisementGridViewWidget extends StatelessWidget {
  const GlobalAdvertisementGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(child: GridView.builder(
      itemCount: 10,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 1.5,
          crossAxisSpacing: AppSize.s10.w,
          mainAxisSpacing: AppSize.s10.h
      ), itemBuilder: (context, index) =>  GlobalAdvertisementItemWidget(
      index: index,
      image: AssetsManager.shopTest,
      title: "هارت اتاك",
      width: MediaQuery.of(context).size.width*0.5,
      height: AppSize.s100.h,
    ),),);
  }
}
