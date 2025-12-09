
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalCircularButtonWidget extends StatelessWidget {
  const GlobalCircularButtonWidget(
      {super.key,
      required this.onTap,
      required this.icon,
       this.iconColor, this.circleColor});
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? circleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: circleColor ?? ColorManager.lightSecondary,
        radius: AppSize.s25.r,
        child: Icon(
          size: AppSize.s25.r,
          icon,
          color: iconColor??ColorManager.black,
        ),
      ),
    );
  }
}
