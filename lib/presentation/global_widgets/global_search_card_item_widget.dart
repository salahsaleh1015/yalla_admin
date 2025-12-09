
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalSearchCardItemWidget extends StatelessWidget {
  const GlobalSearchCardItemWidget({super.key, required this.hintText});

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50.h,
      width: double.infinity,
      child: TextField(
        cursorColor: ColorManager.primary,
        cursorHeight: AppSize.s25.h,
        decoration: InputDecoration(
          fillColor: ColorManager.white,
          filled: true,
          contentPadding: EdgeInsets.only(
            top: AppPadding.p8.h,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          prefixIcon: Icon(
            Icons.search,
            size: AppSize.s25.r,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.s15.r),
              ),
              borderSide: BorderSide(
                  color: ColorManager.socialButtonColor, width: AppSize.s1.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.s15.r),
              ),
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1.w)),
        ),
      ),
    );
  }
}
