
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';


class AdminAddDeliveryBodyWidget extends StatelessWidget {
  const AdminAddDeliveryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "أسم مندوب التوصيل",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل اسم مندوب التوصيل"),
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
            textInputType: TextInputType.text,
            hintText: "ادخل رقم التلفيون"),
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
            textInputType: TextInputType.phone,
            hintText: "ادخل العنوان"),
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
        )
      ],
    );
  }
}