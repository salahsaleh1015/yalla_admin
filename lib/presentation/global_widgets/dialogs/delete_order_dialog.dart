import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/delete_order_cubit/delete_order_cubit.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/delete_order_cubit/delete_order_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/values_manager.dart';

void deleteOrderDialog(BuildContext context, {required String orderId}) {
  showCustomDialog(
    context,
    dialogTitle: "إالغاء الطلب",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "إلغاء الطلب",
    actionButtonCallBack: () {
      context.read<DeleteOrderCubit>().deleteOrder(orderId: orderId);
    },
    content:  DeleteOrderDialogContent(
      orderId: orderId,
    ),
  );
}

// class DeleteOrderDialogContent extends StatelessWidget {
//   const DeleteOrderDialogContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: AppSize.s10.h,),
//         Text("هل أنت متأكد أنك تريد إلغاء الطلب؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//           color: ColorManager.hintColor,
//
//         ),),
//         SizedBox(height: AppSize.s10.h,),
//       ],
//     );
//   }
// }

class DeleteOrderDialogContent extends StatelessWidget {
  final String orderId;

  const DeleteOrderDialogContent({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteOrderCubit, DeleteOrderStates>(
      listener: (context, state) {
        if (state is DeleteOrderSuccessState) {
          Navigator.pop(context);
          showCustomToast(
            context,
            "تم مسح الطلب بنجاح",
            backgroundColor: ColorManager.greenColor,
          );
        }

        if (state is DeleteOrderErrorState) {
          showCustomToast(
            context,
            "حدث خطا ما حاول في وقت لاحق",
            backgroundColor: ColorManager.error,
          );
        }
      },
      builder: (context, state) {
        if (state is DeleteOrderLoadingState) {
          return const Center(child: GlobalLoadingIndicator());
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSize.s10.h),
            Text(
              "هل أنت متأكد أنك تريد إلغاء الطلب؟",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.hintColor,
              ),
            ),
            SizedBox(height: AppSize.s10.h),
          ],
        );
      },
    );
  }
}
