
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class GlobalTextFieldWidget extends StatelessWidget {
  const GlobalTextFieldWidget(
      {super.key,
      required this.textInputType,
      required this.hintText,
      this.height,
      this.controller,
      this.onSaved,
      this.validator, this.letterSpacing});
  final double? height;
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        color: ColorManager.lightPrimary,
      ),
      height: height ?? AppSize.s50.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        child: TextFormField(

          controller: controller,
          cursorColor: ColorManager.primary,
          cursorHeight: AppSize.s25.h,
          maxLines: null, // Set this
          expands: true, // and this
          onSaved: onSaved,
          validator: validator,
          style:  TextStyle(
            letterSpacing: letterSpacing,
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(

              contentPadding: EdgeInsets.only(
                right: AppPadding.p15.w,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.s15.r),
                  ),
                  borderSide: BorderSide(
                      color: ColorManager.primary, width: AppSize.s1.w)),
              hintText: hintText,

              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorManager.hintColor,
                  ),
              fillColor: ColorManager.inputFillColor,
              filled: true),
        ),
      ),
    );
  }
}
