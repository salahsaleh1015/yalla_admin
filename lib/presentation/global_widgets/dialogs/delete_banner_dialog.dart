import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_banner_cubit/delete_banner_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_banner_cubit/delete_banner_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';

import '../../../core/services/dependency_injection_services/service_locator_setup.dart';

void deleteBannerDialog(
  BuildContext context, {
  required DeleteBannerModelForDomain deleteBannerModel,
}) {
  showCustomDialog(
    context,
    dialogTitle: "مسح المعلن",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "مسح المعلن",

    content: DeleteBannerDialog(deleteBannerModel: deleteBannerModel),
  );
}

class DeleteBannerDialog extends StatelessWidget {
  const DeleteBannerDialog({super.key, required this.deleteBannerModel});

  final DeleteBannerModelForDomain deleteBannerModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteBannerCubit>(
      create:
          (context) => DeleteBannerCubit(
            DeleteBannerUseCase(getIt.get<HomeTransactionsRepoImpl>()),
          ),
      child: BlocConsumer<DeleteBannerCubit, DeleteBannerStates>(
        listener: (context, state) async {
          if (state is DeleteBannerSuccessState) {
            showCustomToast(
              context,
              "تم مسح المعلن بنجاح",
              type: ToastType.success,
            );
            await HiveServices.clearHiveBox<HomeBannerEntity>(
              boxName: HiveServices.kBannersBox,
            );
            Navigator.pushReplacementNamed(
              context,
              Routes.adminMainLayoutRoute,
            );
          }
          if (state is DeleteBannerErrorState) {
            showCustomToast(context, "حدث خطا ما", type: ToastType.error);
          }
        },
        builder: (context, state) {
          return state is DeleteBannerLoadingState
              ? Center(child: GlobalLoadingIndicator())
              : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    "هل أنت متأكد أنك تريد مسح المعلن؟",
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
                        DeleteBannerCubit.get(context).deleteBanner(
                          deleteBannerModel: DeleteBannerModelForDomain(
                            bannerId: deleteBannerModel.bannerId,
                            bannerImageUrl: deleteBannerModel.bannerImageUrl,
                          ),
                        );
                      },
                      width: MediaQuery.of(context).size.width * 0.8,
                      text: "إلغاء ",
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
