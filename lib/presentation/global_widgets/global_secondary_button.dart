
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';


class GlobalSecondaryButton extends StatelessWidget {
  const GlobalSecondaryButton({super.key, required this.width, required this.text, required this.onTap, this.height});

  final double width;
  final String text;
  final VoidCallback onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary,
            width: AppSize.s2,
          ),
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s100.r),
        ),
        height:height?? AppSize.s40.h,
        width: width,
        child: Center(
          child: Text(text,style: Theme.of(context).textTheme.labelLarge,),
        ),

      ),
    );
  }
}
