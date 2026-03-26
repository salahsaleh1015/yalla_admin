import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_product_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/edit_product_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_custom_animation_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';
import 'package:yalla_admin/presentation/global_widgets/global_light_button_widget.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({
    super.key,
    required this.product,
    required this.index,
    required this.shopId,
  });

  final HomeShopProductEntity product;
  final int index;
  final String shopId;
  @override
  Widget build(BuildContext context) {
    return GlobalCustomAnimationWidget(
      index: index,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppPadding.p10.h),
        child: GlobalDecoratedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.network(
                    product.productImage,
                    height: AppSize.s100.h,
                    width: AppSize.s130.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: AppSize.s5.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: ColorManager.primary),
                          maxLines: 1,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        Text(
                          product.productDescription,
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 3,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        Text(
                          "${product.productPrice} ج.م",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s5.h),
              GlobalButtonWidget(
                isButtonEnabled: true,
                text: "تعديل",
                onTap: () {
                  editProductDialog(
                    context,
                    deleteShopProductModelForDomain:
                        DeleteShopProductModelForDomain(
                          productId: product.productId,
                          shopId: shopId,
                        ),
                  );
                },
                width: MediaQuery.of(context).size.width,
                height: AppSize.s30.h,
              ),
              SizedBox(height: AppSize.s5.h),
              GlobalLightButtonWidget(
                onTap: () {
                  deleteProductDialog(
                    context,
                    deleteShopProductModelForDomain:
                        DeleteShopProductModelForDomain(
                          productId: product.productId,
                          shopId: shopId,
                        ),
                  );
                },
                width: MediaQuery.of(context).size.width,
                height: AppSize.s30.h,
                child: Text(
                  "حذف",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
