
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart' show GlobalTextFieldWidget;

class AdminAddShopBodyWidget extends StatelessWidget {
  const AdminAddShopBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "أسم الموزع",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل أسم الموزع"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "العنوان",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل العنوان"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "التليفون",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.phone,
            hintText: "ادخل رقم التلفيون"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "ساعات العمل",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل ساعات العمل"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "التقييم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.number,
            hintText: "ادخل تقييم الموزع"),
        SizedBox(
          height: AppSize.s30.h,
        ),
        GlobalButtonWidget(
          isButtonEnabled: true,
          text: "إضافة",
          onTap: () {},
          width: MediaQuery.of(context).size.width,
        ),

      ],
    );
  }
}