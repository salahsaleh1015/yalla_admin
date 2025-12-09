
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/add_image_section.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addVendorDialog(BuildContext context) {
  showCustomDialog(context,
      content: const AddVendorDialogContent(),
      dialogTitle: "إضافة موزع جديد",
      actionButtonHint: "إضافة",
      actionButtonCallBack: () {});
}



class AddVendorDialogContent extends StatelessWidget {
  const AddVendorDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s5.h,
            ),
            const AddImageSection(),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Text(
              "أسم الموزع",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalTextFieldWidget(
                textInputType: TextInputType.text,
                hintText: "ادخل اسم الموزع"),

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
                textInputType: TextInputType.text,
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
                textInputType: TextInputType.text,
                hintText: "ادخل تقييم الموزع"),


          ],
        ),
      ),
    );
  }
}
