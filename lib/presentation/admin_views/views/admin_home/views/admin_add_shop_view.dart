import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_shops_cubit/add_shops_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_shops_cubit/add_shops_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_add_image_button.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';

class AdminAddShopView extends StatefulWidget {
  const AdminAddShopView({super.key});

  @override
  State<AdminAddShopView> createState() => _AdminAddShopViewState();
}

class _AdminAddShopViewState extends State<AdminAddShopView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _rateController = TextEditingController();

  bool isButtonEnabled = false;
  bool isImageAdded = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _rateController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled && isImageAdded;
    });
  }

  @override
  void initState() {
    super.initState();

    _locationController.addListener(_checkIfFieldAreFilled);
    _phoneController.addListener(_checkIfFieldAreFilled);
    _nameController.addListener(_checkIfFieldAreFilled);
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
                  "أسم المعلن",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                buildSmallSpace(),
                GlobalTextFieldWidget(
                  controller: _nameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "ادخل الاسم بالكامل ";
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  hintText: "ادخل اسم مندوب التوصيل",
                ),
                buildSpace(),
                Text("التليفون", style: Theme.of(context).textTheme.bodyMedium),
                buildSmallSpace(),
                GlobalTextFieldWidget(
                  validator: AppConstant.phoneValidation,
                  controller: _phoneController,
                  textInputType: TextInputType.phone,
                  hintText: "ادخل رقم التلفيون",
                ),
                buildSpace(),
                Text("العنوان", style: Theme.of(context).textTheme.bodyMedium),
                buildSmallSpace(),
                GlobalTextFieldWidget(
                  controller: _locationController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "ادخل العنوان بالكامل ";
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  hintText: "ادخل عنوان المندوب",
                ),
                buildSpace(),
                Text("التقييم", style: Theme.of(context).textTheme.bodyMedium),
                buildSmallSpace(),
                GlobalTextFieldWidget(
                  controller: _rateController,
                  formater: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  validator: AppConstant.rateValidator,

                  textInputType: TextInputType.number,
                  hintText: "ادخل تقييم المندوب من 1 الي 5",
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
                BlocProvider<AddShopsCubit>(
                  create:
                      (context) => AddShopsCubit(
                        AddShopUseCase(getIt.get<HomeTransactionsRepoImpl>()),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s2.r),
                    child: BlocConsumer<AddShopsCubit, AddShopsStates>(
                      listener: (context, state) {
                        if (state is AddShopSuccessState) {
                          showCustomToast(
                            context,
                            "تمت الاضافه بنجاح",
                            backgroundColor: ColorManager.primary,
                          );
                          HiveServices.clearHiveBox<HomeShopEntity>(
                            boxName: HiveServices.kShopsBox,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.adminMainLayoutRoute,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddShopLoadingState) {
                          return Center(child: GlobalLoadingIndicator());
                        } else {
                          return GlobalButtonWidget(
                            isButtonEnabled: isButtonEnabled,

                            height: AppSize.s40.h,
                            color: ColorManager.primary,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                num rate =
                                    num.tryParse(_rateController.text) ?? 0;
                                AddShopsCubit.get(context).addShop(
                                  shop: HomeShopEntity(
                                    shopId: "",
                                    shopAddress: _locationController.text,
                                    shopName: _nameController.text,
                                    shopPhoneNumber: _phoneController.text,
                                    shopRate: rate,
                                    shopImage: imageUrl,
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
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _rateController.dispose();

    super.dispose();
  }

  Widget buildSpace() {
    return SizedBox(height: AppSize.s25.h);
  }

  Widget buildSmallSpace() {
    return SizedBox(height: AppSize.s5.h);
  }
}
