import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/get_status_badge_color.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/fetching_deliveries_repo.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_available_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/delete_delivery_cubit/delete_delivery_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/delete_delivery_cubit/delete_delivery_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../core/resources/routes_manager.dart';

void deleteDeliveryDialog(
  BuildContext context, {
  required String deliveryId,
  required String deliveryStatus,
}) {
  showCustomDialog(
    context,
    dialogTitle: "حذف مندوب التوصيل",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "حذف",
    content: DeleteDeliveryDialogContent(
      deliveryId: deliveryId,
      deliveryStatus: deliveryStatus,
    ),
  );
}

class DeleteDeliveryDialogContent extends StatelessWidget {
  const DeleteDeliveryDialogContent({
    super.key,
    required this.deliveryId,
    required this.deliveryStatus,
  });

  final String deliveryId, deliveryStatus;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteDeliveryCubit>(
      create:
          (context) => DeleteDeliveryCubit(
            DeleteDeliveriesUseCase(getIt.get<ActionsOfDeliveriesRepoImpl>()),
          ),
      child: BlocConsumer<DeleteDeliveryCubit, DeleteDeliveryStates>(
        listener: (context, state) {
          if (state is DeleteDeliverySuccessState) {
            showCustomToast(
              context,
              "تم مسح الطلب بنجاح",
                type: ToastType.success
            );
            clearDeliveriesBoxByStatus(deliveryStatus);
            Navigator.pushReplacementNamed(
              context,
              Routes.adminMainLayoutRoute,
            );
          }

          if (state is DeleteDeliveryErrorState) {
            showCustomToast(
              context,
              "حدث خطا ما حاول في وقت لاحق",
                type: ToastType.error
            );
          }
        },
        builder: (context, state) {
          if (state is DeleteDeliveryLoadingState) {
            return const Center(child: GlobalLoadingIndicator());
          }

          return Column(
            children: [
              SizedBox(height: AppSize.s10.h),
              Text(
                "هل أنت متأكد من أنك تريد حذف مندوب التوصيل؟ لن تتمكن من استعادة هذه البيانات.",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorManager.hintColor,
                ),
              ),
              SizedBox(height: AppSize.s10.h),

              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalButtonWidget(
                  isButtonEnabled: true,
                  height: AppSize.s40.h,
                  color: ColorManager.error,
                  onTap: () async {
                    await DeleteDeliveryCubit.get(
                      context,
                    ).deleteUnAvailableDeliveries(deliveryId: deliveryId);
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  text: "إلغاء الطلب",
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}
