import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';


class GlobalBottomNavBarWidget extends StatelessWidget {
  const GlobalBottomNavBarWidget(
      {super.key, required this.items, required this.initialActiveIndex,this.onTap});

  final List<TabItem<dynamic>> items;
  final int initialActiveIndex;
  final  void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      curve: Curves.fastOutSlowIn,
      color: ColorManager.secondaryTextColor,
      activeColor: ColorManager.primary,
      backgroundColor: ColorManager.white,
      height: AppSize.s50.h,
      initialActiveIndex: initialActiveIndex,
      items: items,
      onTap: onTap,
    );
  }
}
