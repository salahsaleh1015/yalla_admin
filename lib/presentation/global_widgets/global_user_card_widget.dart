import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalUserCardWidget extends StatelessWidget {
  const GlobalUserCardWidget({super.key, required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      AssetsManager.userAvatar,
      height: radius.h,
      width: radius.w,
    );
  }
}
