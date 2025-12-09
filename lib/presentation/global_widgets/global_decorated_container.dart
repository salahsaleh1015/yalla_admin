
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalDecoratedContainer extends StatelessWidget {
  const GlobalDecoratedContainer({super.key, required this.child, this.width, this.padding});

  final Widget child;

  final EdgeInsets? padding;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:padding?? EdgeInsets.all(AppPadding.p10.r),
      width:width?? MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        border: Border.all(
            color: ColorManager.socialButtonColor, width: AppSize.s1.w),
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: child,
    );

  }
}
