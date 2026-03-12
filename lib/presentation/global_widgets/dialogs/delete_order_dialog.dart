import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/orders_management_repo/fetch_orders_repo.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/repos/order_management_repos/fetching_orders_repo.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/delete_order_usecase.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/delete_order_cubit/delete_order_cubit.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/delete_order_cubit/delete_order_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/values_manager.dart';

void deleteOrderDialog(
  BuildContext context, {
  required String orderId,
  required String orderStatus,
}) {
  showCustomDialog(
    context,
    dialogTitle: "إالغاء الطلب",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "إلغاء الطلب",

    content: DeleteOrderDialogContent(
      orderId: orderId,
      orderStatus: orderStatus,
    ),
  );
}

class DeleteOrderDialogContent extends StatelessWidget {
  final String orderId, orderStatus;

  const DeleteOrderDialogContent({
    super.key,
    required this.orderId,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => DeleteOrderCubit(
            DeleteOrderUseCase(getIt.get<FetchOrdersRepoImpl>()),
          ),
      child: BlocConsumer<DeleteOrderCubit, DeleteOrderStates>(
        listener: (context, state) {
          if (state is DeleteOrderSuccessState) {
            clearHiveBoxes();
            Navigator.pushReplacementNamed(
              context,
              Routes.adminMainLayoutRoute,
            );
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
              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalButtonWidget(
                  isButtonEnabled: true,
                  height: AppSize.s40.h,
                  color: ColorManager.error,
                  onTap: () {
                    DeleteOrderCubit.get(context).deleteOrder(orderId: orderId);
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

  void clearHiveBoxes() {
    clearOrdersBoxByStatus(orderStatus);
  }

  void clearOrdersBoxByStatus(String orderStatus) {
    switch (orderStatus) {
      case 'المقبولة':
        HiveServices.clearHiveBox<OrderEntity>(
          boxName: HiveServices.kAcceptedOrdersBox,
        );
        break;

      case 'الملغية':
        HiveServices.clearHiveBox<OrderEntity>(
          boxName: HiveServices.kCanceledOrdersBox,
        );
        break;

      case 'مكتملة':
        HiveServices.clearHiveBox<OrderEntity>(
          boxName: HiveServices.kCompletedOrdersBox,
        );
        break;

      case 'المعلقة':
        HiveServices.clearHiveBox<OrderEntity>(
          boxName: HiveServices.kPendingOrdersBox,
        );
        break;
    }
  }
}
