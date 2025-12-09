
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';






void editVendorDialog(BuildContext context) {
  showCustomDialog(context,
      content: const EditVendorDialogContent(),
      dialogTitle: " تعديل بيانات الموزع",
      actionButtonHint: "تعديل",
      actionButtonCallBack: () {});
}

class EditVendorDialogContent extends StatelessWidget {
  const EditVendorDialogContent({super.key});

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