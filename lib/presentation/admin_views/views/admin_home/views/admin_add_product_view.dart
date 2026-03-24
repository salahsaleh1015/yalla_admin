import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/add_home_data_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_product_usecases.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_product_cubit/add_product_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_product_cubit/add_product_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_add_image_button.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

class AdminAddProductView extends StatefulWidget {
  const AdminAddProductView({super.key, required this.shopId});

  final String shopId;
  @override
  State<AdminAddProductView> createState() => _AdminAddProductViewState();
}

class _AdminAddProductViewState extends State<AdminAddProductView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  bool isButtonEnabled = false;
  bool isImageAdded = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _productNameController.text.isNotEmpty &&
        _productDescriptionController.text.isNotEmpty &&
        _productPriceController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled && isImageAdded;
    });
  }

  @override
  void initState() {
    super.initState();

    _productNameController.addListener(_checkIfFieldAreFilled);
    _productDescriptionController.addListener(_checkIfFieldAreFilled);
    _productPriceController.addListener(_checkIfFieldAreFilled);
  }

  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdminMainBar(),
                SizedBox(height: AppSize.s50.h),

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
                Center(
                  child: GlobalAddImageButton(
                    onImageUploaded: (url) {
                      print("Image URL: $url");
                      imageUrl = url;

                      if (imageUrl.isNotEmpty) {
                        setState(() {
                          isImageAdded = true;
                          // Trigger the check here!
                          _checkIfFieldAreFilled();
                        });
                      }
                    },
                  ),
                ),
                buildSpace(),
                BlocProvider<AddProductCubit>(
                  create:
                      (context) => AddProductCubit(
                        AddShopProductUseCase(getIt.get<AddHomeDataRepoImpl>()),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s2.r),
                    child: BlocConsumer<AddProductCubit, AddProductStates>(
                      listener: (context, state) {
                        if (state is AddProductSuccessState) {
                          showCustomToast(
                            context,
                            "تمت الاضافه بنجاح",
                            backgroundColor: ColorManager.primary,
                          );

                          Navigator.pushReplacementNamed(
                            context,
                            Routes.adminMainLayoutRoute,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddProductLoadingState) {
                          return Center(child: GlobalLoadingIndicator());
                        } else {
                          return GlobalButtonWidget(
                            isButtonEnabled: isButtonEnabled,

                            height: AppSize.s40.h,
                            color: ColorManager.primary,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                num price =
                                    num.tryParse(
                                      _productPriceController.text,
                                    ) ??
                                    0;
                                AddProductCubit.get(context).addProduct(
                                  addProduct: AddShopProductModelForDomain(
                                    shopId: widget.shopId,
                                    newProduct: HomeShopProductEntity(
                                      productDescription:
                                          _productDescriptionController.text,
                                      productId: "",
                                      productImage: imageUrl,
                                      productName: _productNameController.text,
                                      productPrice: price,
                                    ),
                                  ),
                                );
                              }
                            },
                            width: MediaQuery.of(context).size.width * 0.95,
                            text: "اضف",
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
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
