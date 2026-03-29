import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/home_details_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_details_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_shop_cubit/delete_shop_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_shop_cubit/delete_shop_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import '../../../core/resources/colors_manager.dart';

void deleteVendorDialog(BuildContext context, {required DeleteShopModelForDomain deleteShopMadel}) {
  showCustomDialog(
    context,
    dialogTitle: " حذف موزع الخدمة؟",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "حذف",
    content: DeleteVendorDialogContent(
        deleteShopMadel: deleteShopMadel),
  );
}

class DeleteVendorDialogContent extends StatelessWidget {
  const DeleteVendorDialogContent({super.key, required this.deleteShopMadel});

  final DeleteShopModelForDomain deleteShopMadel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "سيتم حذف جميع البيانات المرتبطة بموزع الخدمة هذا. لا يمكن التراجع عن هذه العملية.",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: ColorManager.hintColor),
        ),
        SizedBox(height: AppSize.s10.h),
        BlocProvider<DeleteShopCubit>(
          create:
              (context) => DeleteShopCubit(
                DeleteShopUseCase(getIt.get<HomeDetailsTransactionsRepoImpl>()),
              ),
          child: BlocConsumer<DeleteShopCubit, DeleteShopStates>(
            listener: (context, state) async{
              if(state is DeleteShopSuccessState){
                showCustomToast(
                  context,
                  "تمت المسج بنجاح",
                    type: ToastType.success
                );
                await HiveServices.clearHiveBox<HomeShopEntity>(
                  boxName: HiveServices.kShopsBox,
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.adminMainLayoutRoute,
                );
              }
              if(state is DeleteShopErrorState){
                Navigator.pop(context);
                showCustomToast(
                  context,
                  "حدث خطا ما",
                    type: ToastType.error
                );

              }
            },
            builder: (context, state) {
              return state is DeleteShopLoadingState ? Center(
                child: GlobalLoadingIndicator(),
              ) : GlobalButtonWidget(
                text: "مسح",
                onTap: () {
                  DeleteShopCubit.get(context).deleteShop(deleteShopMadel: deleteShopMadel);
                },
                width: double.infinity,
                isButtonEnabled: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
