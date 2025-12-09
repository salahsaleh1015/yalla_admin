
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalSecondaryDecoratedContainer extends StatelessWidget {
  const GlobalSecondaryDecoratedContainer({super.key, required this.child, required this.width, required this.height});
 final Widget child;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      decoration:  BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s12.r),
            bottomRight: Radius.circular(AppSize.s12.r),
          )

      ),
      child: child,
    );
  }
}
