
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_account_info_bar_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_account_info_section_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_ads_bar_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_logout_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_profile_card_widget.dart';

class AdminAccountView extends StatelessWidget {
  const AdminAccountView({super.key});

  static const String id = "AdminAccountView";
  @override
  Widget build(BuildContext context) {
    return  GlobalPaddingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "الحساب",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const   GlobalAccountInfoSectionWidget(
            joinDate: "انضم منذ 12 اكتوبر 2024",

            userName: "محمود الفيشاوي",
          ),
          SizedBox(
            height: AppSize.s20.h,
          ),
          Divider(
            color: ColorManager.socialButtonColor,
            height: AppSize.s1.h,
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          GlobalAccountInfoBarWidget(onPressed: () {
            Navigator.pushNamed(context, Routes.adminEditAccountRoute);
          },),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalProfileCardWidget(
            fieldName: "الاسم بالكامل",
            fieldValue: "محمود احمد الفيشاوي",
          ),
          SizedBox(
            height: AppSize.s20.h,
          ),
          const GlobalProfileCardWidget(
            fieldName: "رمز المرور",
            fieldValue: "000 111 2222",
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          GlobalAdsBarWidget(onPressed: () {
            Navigator.pushNamed(context, Routes.adminAddAdsRoute);
          },),
          SizedBox(
            height: AppSize.s50.h,
          ),
           GlobalLogoutButtonWidget(
             actionButtonCall: () {
               Navigator.pushReplacementNamed(
                   context, Routes.adminAuthenticationRoute);
             },
           ),
        ],
      ),
    );
  }
}
