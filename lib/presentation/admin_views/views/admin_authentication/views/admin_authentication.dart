import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_authentication/widgets/sign_in_content.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_authentication/widgets/sign_in_image.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

class AdminAuthenticationView extends StatefulWidget {
  AdminAuthenticationView({super.key});

  @override
  State<AdminAuthenticationView> createState() =>
      _AdminAuthenticationViewState();
}

class _AdminAuthenticationViewState extends State<AdminAuthenticationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled = _passwordController.text.length == 11;
    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkIfFieldAreFilled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppSize.s50.h),
                SignInImage(),
                SignInContent(),
                SizedBox(height: AppSize.s10.h),
                GlobalTextFieldWidget(
                  controller: _passwordController,
                  validator: (val) {
                    if (val!.length != 12 ||
                        _passwordController.text != "12345678910") {
                      return "ادخل الرقم بشكل صحيح";
                    }
                    return null;
                  },
                  hintText: "ادخل الرمز الخاص بك",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: AppSize.s30.h),
                GlobalButtonWidget(
                  isButtonEnabled: isButtonEnabled,
                  width: double.infinity,
                  text: "متابعة",
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        _passwordController.text == "M0-Y@ll@2026") {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.adminMainLayoutRoute,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
