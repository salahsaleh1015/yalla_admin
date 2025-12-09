
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_secondary_decorated_container.dart';

import '../../../core/resources/assets_manager.dart';

class GlobalAdvertisementItemWidget extends StatelessWidget {
  const GlobalAdvertisementItemWidget(
      {super.key,
      this.height,
      this.width,
      required this.image,
      required this.title});
  final double? height, width;

  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            topRight: Radius.circular(AppSize.s12.r),
          ),
          child: Image.asset(
              fit: BoxFit.fill,
              width: width ?? AppSize.s150.w,
              height: height ?? AppSize.s90.h,
             image ),
        ),
        GlobalSecondaryDecoratedContainer(
          width: width ?? AppSize.s150.w,
          height: AppSize.s40.h,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.primary),
            ),
          ),
        )
      ],
    );
  }
}
