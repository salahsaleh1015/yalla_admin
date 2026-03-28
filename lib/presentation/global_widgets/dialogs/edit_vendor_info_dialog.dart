import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/repos/home_repo/home_details_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/shop_details_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_shop_info_cubit/edit_shop_info_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_shop_info_cubit/edit_shop_info_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

import '../../../core/services/dependency_injection_services/service_locator_setup.dart';

void editVendorDialog(BuildContext context, {required String shopId}) {
  showCustomDialog(
    context,
    content: EditVendorDialogContent(shopId: shopId),
    dialogTitle: " تعديل بيانات الموزع",
    actionButtonHint: "تعديل",
  );
}

class EditVendorDialogContent extends StatefulWidget {
  const EditVendorDialogContent({super.key, required this.shopId});

  final String shopId;
  @override
  State<EditVendorDialogContent> createState() =>
      _EditVendorDialogContentState();
}

class _EditVendorDialogContentState extends State<EditVendorDialogContent> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _rateController = TextEditingController();

  bool isButtonEnabled = false;
  void _checkIfFieldAreFilled() {
    final isFilled =
        _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _rateController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();

    _locationController.addListener(_checkIfFieldAreFilled);
    _phoneController.addListener(_checkIfFieldAreFilled);
    _nameController.addListener(_checkIfFieldAreFilled);
    _rateController.addListener(_checkIfFieldAreFilled);
  }

 late String rate;
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
              Text("أسم المحل", style: Theme.of(context).textTheme.bodyMedium),
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
                hintText: "ادخل اسم المحل بالكامل",
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
                validator: AppConstant.rateValidator,
                textInputType: TextInputType.number,
                hintText: "ادخل تقييم المندوب من 1 الي 5",
              ),

              buildSpace(),
              BlocProvider<EditShopInfoCubit>(
                create:
                    (context) => EditShopInfoCubit(
                      EditShopInfoUseCase(
                        getIt.get<HomeDetailsTransactionsRepoImpl>(),
                      ),
                    ),
                child: Padding(
                  padding: EdgeInsets.all(AppSize.s2.r),
                  child: BlocConsumer<EditShopInfoCubit, EditShopInfoStates>(
                    listener: (context, state) async{
                      if (state is EditShopInfoSuccessState) {
                        showCustomToast(
                          context,
                          "تمت التعديل بنجاح",
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

                      if (state is EditShopInfoErrorState) {
                        Navigator.pop(context);
                        showCustomToast(
                          context,
                          "حدث خطا ما",
                            type: ToastType.error
                        );

                      }
                    },
                    builder: (context, state) {
                      if (state is EditShopInfoLoadingState) {
                        return Center(child: GlobalLoadingIndicator());
                      } else {
                        return GlobalButtonWidget(
                          isButtonEnabled: isButtonEnabled,

                          height: AppSize.s40.h,
                          color: ColorManager.primary,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              EditShopInfoCubit.get(context).editShopInfo(
                                updatedProductInfo: EditShopInfoModelForDomain(
                                  shopId: widget.shopId,
                                  newShop: HomeShopEntity(
                                    shopId: "",
                                    shopImage: "",
                                    shopRate:_rateController.text,
                                    shopPhoneNumber: _phoneController.text,
                                    shopName: _nameController.text,
                                    shopAddress: _locationController.text,
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
