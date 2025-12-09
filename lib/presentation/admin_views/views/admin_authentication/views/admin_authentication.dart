
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

import '../../admin_main_layout/views/admin_main_layout.dart';

class AdminAuthenticationView extends StatelessWidget {
  const AdminAuthenticationView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: AppSize.s50.h,
              ),
              Text("مرحباً بعودتك!",
                  style: Theme.of(context).textTheme.displayMedium),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text(
                  "قم بتسجيل الدخول إلى حسابك لاداره موزعينك و الطلبات الجديده.",
                  style: Theme.of(context).textTheme.labelSmall),
              SizedBox(
                height: AppSize.s50.h,
              ),
              Text("البريد الالكتروني",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const GlobalTextFieldWidget(
                hintText: "ادخل البريد الخاص بك",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              Text("كلمه المرور",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const GlobalTextFieldWidget(
                hintText: "ادخل كلمه المرور",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                isButtonEnabled: true,
                width: double.infinity,
                text: "متابعة",
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.adminMainLayoutRoute);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
