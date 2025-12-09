
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class AdminMainBar extends StatelessWidget {
  const AdminMainBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الرئيسية",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Image.asset(
            AssetsManager.adminAvatar,
            width: AppSize.s55.w,
            height: AppSize.s50.h,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
