
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/font_manager.dart';
import 'package:yalla_admin/core/resources/style_manager.dart';

//+4 fontSize for responsive

ThemeData getApplicationTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      textTheme: TextTheme(
        displaySmall: getMediumTextStyle(
            fontSize: FontSize.s22.sp, color: ColorManager.secondaryTextColor),
        titleLarge: getBoldTextStyle(
            color: ColorManager.primary, fontSize: FontSize.s32.sp),
        bodyLarge: getBoldTextStyle(
            color: ColorManager.black, fontSize: FontSize.s32.sp),
        labelSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor, fontSize: FontSize.s16.sp),
        titleSmall: getSemiBoldTextStyle(
            fontSize: FontSize.s20.sp, color: ColorManager.white),
        bodySmall: getSemiBoldTextStyle(
            color: ColorManager.primary, fontSize: FontSize.s16.sp),
        displayMedium: getBoldTextStyle(
            color: ColorManager.black, fontSize: FontSize.s24.sp),
        headlineMedium: getRegularTextStyle(
            color: ColorManager.black, fontSize: FontSize.s16.sp),
        bodyMedium: getMediumTextStyle(
            color: ColorManager.black, fontSize: FontSize.s16.sp),
        headlineSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor, fontSize: FontSize.s16.sp),
        labelMedium: getRegularTextStyle(
            color: ColorManager.secondaryTextColor, fontSize: FontSize.s12.sp),
        headlineLarge: getBoldTextStyle(
            color: ColorManager.primary, fontSize: FontSize.s20.sp),
        titleMedium: getSemiBoldTextStyle(
            color: ColorManager.black, fontSize: FontSize.s20.sp),
        labelLarge: getMediumTextStyle(
            color: ColorManager.primary, fontSize: FontSize.s14.sp),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              fontSize: FontSize.s12.sp),
          selectedLabelStyle: TextStyle(
              fontSize:FontSize.s12.sp),
          backgroundColor: ColorManager.white,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.hintColor));
}
