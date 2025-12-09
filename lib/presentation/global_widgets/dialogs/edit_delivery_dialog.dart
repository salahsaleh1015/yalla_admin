
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

void editDeliveryDialog(BuildContext context) {
  showCustomDialog(context, content: const EditDeliveryDialogContent(),
      dialogTitle: "تعديل البيانات",
      actionButtonHint: "حفظ",
      actionButtonCallBack: (){});
}




class EditDeliveryDialogContent extends StatelessWidget {
  const EditDeliveryDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("أسم مندوب التوصيل",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.text, hintText: "ادخل اسم مندوب التوصيل"),
        buildSpace(),
        Text("التليفون",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.phone, hintText: "ادخل رقم التلفيون"),
        buildSpace(),
        Text("العنوان",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.text, hintText: "ادخل عنوان المندوب"),
        buildSpace(),
        Text("التقييم",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.number, hintText: "ادخل تقييم المندوب"),
        buildSpace(),
      ],
    );
  }
  Widget buildSpace() {
    return  SizedBox(
      height: AppSize.s25.h,
    );
  }

  Widget buildSmallSpace() {
    return  SizedBox(
      height: AppSize.s5.h,
    );
  }
}