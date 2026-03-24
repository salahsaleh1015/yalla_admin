import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/add_home_data_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_product_cubit/delete_product_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_product_cubit/delete_product_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../core/services/dependency_injection_services/service_locator_setup.dart';

void deleteProductDialog(
  BuildContext context, {
  required DeleteShopProductModelForDomain deleteShopProductModelForDomain,
}) {
  showCustomDialog(
    context,
    dialogTitle: "حذف المنتج",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "حذف",
    content: DeleteProductDialogContent(
      deleteShopProductModelForDomain: deleteShopProductModelForDomain,
    ),
  );
}

class DeleteProductDialogContent extends StatelessWidget {
  const DeleteProductDialogContent({
    super.key,
    required this.deleteShopProductModelForDomain,
  });
  final DeleteShopProductModelForDomain deleteShopProductModelForDomain;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h),
        Text(
          "هل أنت متأكد من أنك تريد حذف المنتج [اسم المنتج]؟ هذا الإجراء لا يمكن التراجع عنه.",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: ColorManager.hintColor),
        ),
        SizedBox(height: AppSize.s10.h),

        BlocProvider<DeleteProductCubit>(
          create:
              (context) => DeleteProductCubit(
                DeleteShopProductUseCase(getIt.get<AddHomeDataRepoImpl>()),
              ),
          child: BlocConsumer<DeleteProductCubit, DeleteProductStates>(
            listener: (context, state) {
              if (state is DeleteProductSuccessState) {
                Navigator.pop(context);
                showCustomToast(
                  context,
                  "تم الحذف بنجاح",
                  backgroundColor: ColorManager.primary,
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.adminMainLayoutRoute,
                );
              }

              if (state is DeleteProductErrorState) {
                Navigator.pop(context);
                showCustomToast(
                  context,
                  "حدث خطا ما",
                  backgroundColor: ColorManager.error,
                );
              }
            },
            builder: (context, state) {
              return state is DeleteProductLoadingState
                  ? Center(child: GlobalLoadingIndicator())
                  : GlobalButtonWidget(
                    text: "مسح",
                    onTap: () {
                      DeleteProductCubit.get(context).deleteProduct(
                        deleteProduct: deleteShopProductModelForDomain,
                      );
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
