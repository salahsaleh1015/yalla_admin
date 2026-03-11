
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

void addAdsDialog(BuildContext context) {
  showCustomDialog(context,
      content: const AddAdsDialogContent(),
      dialogTitle: "إضافة شريك الإعلان",
      actionButtonHint: "إضافة",
      );
}


class AddAdsDialogContent extends StatelessWidget {
  const AddAdsDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
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
          "الاسم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل الاسم"),
        SizedBox(
          height: AppSize.s10.h,
        ),
      ],
    );
  }
}


