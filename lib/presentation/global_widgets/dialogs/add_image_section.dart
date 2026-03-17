import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_add_image_button.dart';

import '../../../core/resources/colors_manager.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s100.h,

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.greenColor,
        //color: ColorManager.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      child: Center(
        child: GlobalAddImageButton(
          onImageUploaded: (imageUrl) {
            print("Image URL: $imageUrl");
          },
        ),
      ),
    );
  }
}
