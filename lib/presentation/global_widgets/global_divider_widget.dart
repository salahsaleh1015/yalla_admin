
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalDividerWidget extends StatelessWidget {
  const GlobalDividerWidget({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ColorManager.socialButtonColor,
      height: AppSize.s5.h,
    );
  }
}
