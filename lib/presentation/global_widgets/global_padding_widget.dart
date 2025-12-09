
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
class GlobalPaddingWidget extends StatelessWidget {
  const GlobalPaddingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.only(
      top: AppPadding.p50.h,
      left: AppPadding.p10.w,
      right: AppPadding.p10.w,
    ),
      child: child,
    );
  }
}
