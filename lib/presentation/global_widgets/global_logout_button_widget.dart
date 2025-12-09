
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_light_button_widget.dart';

class GlobalLogoutButtonWidget extends StatelessWidget {
  const GlobalLogoutButtonWidget({super.key, required this.actionButtonCall});

 final  void Function() actionButtonCall;
  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      onTap: actionButtonCall,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: ColorManager.error,
          ),
          SizedBox(
            width: AppSize.s10.w,
          ),
          Text(
            "تسجيل الخروج",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorManager.error),
          ),
        ],
      ),
    );
  }
}

class LogoutDialogContent extends StatelessWidget {
  const LogoutDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.hintColor,
              ),
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
      ],
    );
  }
}
