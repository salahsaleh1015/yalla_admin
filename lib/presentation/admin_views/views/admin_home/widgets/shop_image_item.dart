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
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_banner_cubit/delete_banner_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_banner_cubit/delete_banner_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_banner_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_banner_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../../../domain/usecases/home_usecases/home_transactions_usecases.dart';

class ShopImageItem extends StatelessWidget {
  const ShopImageItem({super.key,  required this.deleteBannerModel});
  final DeleteBannerModelForDomain deleteBannerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(deleteBannerModel.bannerImageUrl)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10.w,
          vertical: AppPadding.p50.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalCircularButtonWidget(
              onTap: () async {
                // await clearHiveBox<HomeShopProductEntity>(boxName: kProductsBox);
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            ),

            SizedBox(width: AppSize.s10.w),

            GlobalCircularButtonWidget(
              onTap: () async {
                deleteBannerDialog(context,deleteBannerModel: deleteBannerModel);
              },
              icon: Icons.delete_forever_sharp,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            ),



          ],
        ),
      ),
    );
  }
}


