import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/home_details_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_details_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_product_cubit/edit_product_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

import '../../../core/services/dependency_injection_services/service_locator_setup.dart';

void editProductDialog(
  BuildContext context,{required DeleteShopProductModelForDomain deleteShopProductModelForDomain}) {
  showCustomDialog(
    context,
    content: EditProductDialogContent(
     deleteShopProductModelForDomain: deleteShopProductModelForDomain,
    ),
    dialogTitle: "تعديل بيانات المنتج",
    actionButtonHint: "حفظ",
  );
}

class EditProductDialogContent extends StatefulWidget {
  const EditProductDialogContent({
    super.key,
   required this.deleteShopProductModelForDomain
  });


 final DeleteShopProductModelForDomain deleteShopProductModelForDomain;
  @override
  State<EditProductDialogContent> createState() => _EditProductDialogContentState();
}

class _EditProductDialogContentState extends State<EditProductDialogContent> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _productNameController = TextEditingController();

  TextEditingController _productDescriptionController = TextEditingController();

  TextEditingController _productPriceController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _productNameController.text.isNotEmpty &&
            _productDescriptionController.text.isNotEmpty &&
            _productPriceController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();

    _productNameController.addListener(_checkIfFieldAreFilled);
    _productDescriptionController.addListener(_checkIfFieldAreFilled);
    _productPriceController.addListener(_checkIfFieldAreFilled);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s20.h),
              Text(
                "أسم المنتج",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              buildSmallSpace(),
              GlobalTextFieldWidget(
                controller: _productNameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "ادخل الاسم بالكامل ";
                  }
                  return null;
                },
                textInputType: TextInputType.text,
                hintText: "ادخل اسم المنتج",
              ),
              buildSpace(),
              Text(
                "وصف المنتج",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              buildSmallSpace(),
              GlobalTextFieldWidget(
                height: AppSize.s80.h,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "ادخل الوصف بالكامل ";
                  }
                  return null;
                },
                controller: _productDescriptionController,
                textInputType: TextInputType.phone,
                hintText: "ادخل وصف المنتج",
              ),
              buildSpace(),
              Text("السعر", style: Theme.of(context).textTheme.bodyMedium),
              buildSmallSpace(),
              GlobalTextFieldWidget(
                controller: _productPriceController,

                validator: AppConstant.priceValidation,
                textInputType: TextInputType.number,
                hintText: "ادخل سعر المنتج بشكل صحيح",
              ),
              buildSpace(),
              BlocProvider<EditProductCubit>(
                create:
                    (context) => EditProductCubit(
                      EditProductUseCase(getIt.get<HomeDetailsTransactionsRepoImpl>()),
                    ),
                child: BlocConsumer<EditProductCubit, EditProductStates>(
                  listener: (context, state) {
                    if (state is EditProductSuccessState) {
                      Navigator.pop(context);
                      showCustomToast(
                        context,
                        "تم التعديل بنجاح",
                          type: ToastType.success
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.adminMainLayoutRoute,
                      );
                    }

                    if (state is EditProductErrorState) {
                      Navigator.pop(context);
                      showCustomToast(
                        context,
                        "حدث خطا ما",
                          type: ToastType.error
                      );
                    }
                  },
                  builder:  (context, state){
                    return state is EditProductLoadingState ? Center(
                      child: GlobalLoadingIndicator(),
                    ) :GlobalButtonWidget(
                      text: "عدل",
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          num price =
                              num.tryParse(
                                _productPriceController.text,
                              ) ??
                                  0;
                          EditProductCubit.get(context).editProduct(
                            updatedProduct: EditShopProductModelForDomain(
                              productId: widget.deleteShopProductModelForDomain.productId,
                              shopId: widget.deleteShopProductModelForDomain.shopId,
                              updatedProduct: HomeShopProductEntity(
                                productId: widget.deleteShopProductModelForDomain.productId,
                                productPrice: price,
                                productName: _productNameController.text,
                                productImage: "", // مش هيتبعت لو toJson صح
                                productDescription: _productDescriptionController.text,
                              ),
                            ),
                          );
                        }

                      },
                      width: double.infinity,
                      isButtonEnabled: isButtonEnabled,
                    );
                  }

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }

  Widget buildSpace() {
    return SizedBox(height: AppSize.s25.h);
  }

  Widget buildSmallSpace() {
    return SizedBox(height: AppSize.s5.h);
  }
}
