import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';

class AddBarHeader extends StatelessWidget {
  const AddBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsManager.adminAvatar,
            width: AppSize.s55.w,
            height: AppSize.s50.h,
            fit: BoxFit.fill,
          ),
          GlobalCircularButtonWidget(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
