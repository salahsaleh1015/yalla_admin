


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';

void  deleteDeliveryDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "حذف مندوب التوصيل",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "حذف",actionButtonCallBack: (){},
      content:const DeleteDeliveryDialogContent());
}

class DeleteDeliveryDialogContent extends StatelessWidget {
  const DeleteDeliveryDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("هل أنت متأكد من أنك تريد حذف مندوب التوصيل؟ لن تتمكن من استعادة هذه البيانات.",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}
