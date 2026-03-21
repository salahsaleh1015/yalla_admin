import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/home_repo/add_home_data_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/add_banner_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_banner_cubit/add_banner_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_banner_cubit/add_banner_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/global_add_image_button.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';

class AdminAddBannerView extends StatefulWidget {
  const AdminAddBannerView({super.key});

  @override
  State<AdminAddBannerView> createState() => _AdminAddBannerViewState();
}

class _AdminAddBannerViewState extends State<AdminAddBannerView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  bool isButtonEnabled = false;
  bool isImageAdded = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _nameController.text.isNotEmpty ||
        _phoneController.text.isNotEmpty ||
        _locationController.text.isNotEmpty;

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
                BlocProvider<AddBannerCubit>(
                  create:
                      (context) => AddBannerCubit(
                        AddBannerUseCase(getIt.get<AddHomeDataRepoImpl>()),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s2.r),
                    child: BlocConsumer<AddBannerCubit, AddBannerStates>(
                      listener: (context, state) {
                        if (state is AddBannerSuccessState) {
                          showCustomToast(
                            context,
                            "تمت الاضافه بنجاح",
                            backgroundColor: ColorManager.primary,
                          );
                          HiveServices.clearHiveBox<HomeBannerEntity>(
                            boxName: HiveServices.kBannersBox,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.adminMainLayoutRoute,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddBannerLoadingState) {
                          return Center(child: GlobalLoadingIndicator());
                        } else {
                          return GlobalButtonWidget(
                            isButtonEnabled: isButtonEnabled,

                            height: AppSize.s40.h,
                            color: ColorManager.primary,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                AddBannerCubit.get(context).addBanner(
                                  banner: HomeBannerEntity(
                                    bannerImage: imageUrl,
                                    bannerShopName: _nameController.text,
                                    bannerId: '',
                                    bannerShopAddress: _locationController.text,
                                    bannerShopPhoneNumber:
                                        _phoneController.text,
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

  Widget buildSpace() {
    return SizedBox(height: AppSize.s25.h);
  }

  Widget buildSmallSpace() {
    return SizedBox(height: AppSize.s5.h);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
