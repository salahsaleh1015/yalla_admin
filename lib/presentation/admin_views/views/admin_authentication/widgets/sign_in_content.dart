


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "مرحباً بعودتك!",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: AppSize.s20.h),
        Text(
          "قم بتسجيل الدخول إلى حسابك لاداره موزعينك و الطلبات الجديده.",
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
