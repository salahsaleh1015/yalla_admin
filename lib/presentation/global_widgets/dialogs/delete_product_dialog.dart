
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';

void deleteProductDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "حذف المنتج",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "حذف",
      content:const DeleteProductDialogContent());
}

class DeleteProductDialogContent extends StatelessWidget {
  const DeleteProductDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("هل أنت متأكد من أنك تريد حذف المنتج [اسم المنتج]؟ هذا الإجراء لا يمكن التراجع عنه.",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}
