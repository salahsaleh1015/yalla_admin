import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_banner_cubit/add_banner_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_banner_cubit/add_banner_state.dart';
import 'package:yalla_admin/presentation/global_widgets/add_bar_header.dart';
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

  bool isButtonEnabled = false;
  bool isImageAdded = false;

  void _checkIfFieldAreFilled() {
    setState(() {
      isButtonEnabled = isImageAdded;
    });
  }

  @override
  void initState() {
    super.initState();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AddBarHeader(),
                SizedBox(height: AppSize.s50.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(
                    color: ColorManager.lightGrayColor,
                    borderRadius: BorderRadius.circular(AppSize.s8.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image(
                      image:
                          imageUrl == ''
                              ? AssetImage(AssetsManager.notFound)
                              : NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
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
                        AddBannerUseCase(getIt.get<HomeTransactionsRepoImpl>()),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s2.r),
                    child: BlocConsumer<AddBannerCubit, AddBannerStates>(
                      listener: (context, state) async {
                        if (state is AddBannerSuccessState) {
                          showCustomToast(
                            context,
                            "تمت الاضافه بنجاح",
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
                      },
                      builder: (context, state) {
                        if (state is AddBannerLoadingState) {
                          return Center(child: GlobalLoadingIndicator());
                        } else {
                          return GlobalButtonWidget(
                            isButtonEnabled: imageUrl != '',

                            height: AppSize.s40.h,
                            color: ColorManager.primary,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                AddBannerCubit.get(context).addBanner(
                                  banner: HomeBannerEntity(
                                    bannerImage: imageUrl,
                                    bannerId: '',
                                    bannerLanguage: "arabic",
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
    super.dispose();
  }
}
