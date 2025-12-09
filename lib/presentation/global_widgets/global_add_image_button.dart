



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

import '../../../core/resources/font_manager.dart';

class GlobalAddImageButton extends StatelessWidget {
  const GlobalAddImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width/3,
        height: AppSize.s30.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.camera_alt,color: ColorManager.white, size: AppSize.s20.sp,),
            Text("إضافة صورة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.white,fontSize: FontSize.s14.sp),),

          ],
        ),
      ),
    );
  }
}
