import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/add_delivery_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/add_delivery_bar_header.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/add_delivery_cubit/add_delivery_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/add_delivery_cubit/add_delivery_state.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_image_section.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

class AdminAddDeliveryView extends StatefulWidget {
  const AdminAddDeliveryView({super.key});

  @override
  State<AdminAddDeliveryView> createState() => _AdminAddDeliveryViewState();
}

class _AdminAddDeliveryViewState extends State<AdminAddDeliveryView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

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
                AddDeliveryBarHeader(),
                SizedBox(height: AppSize.s50.h),


                Text(
                  "أسم مندوب التوصيل",
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
                      return "ادخل الاسم بالكامل ";
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
                BlocProvider<AddDeliveryCubit>(
                  create:
                      (context) => AddDeliveryCubit(
                        AddDeliveriesUseCase(
                          getIt.get<ActionsOfDeliveriesRepoImpl>(),
                        ),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s2.r),
                    child: BlocConsumer<AddDeliveryCubit, AddDeliveryStates>(
                      listener: (context, state) {
                        if (state is AddDeliverySuccessState) {
                          showCustomToast(
                            context,
                            "تمت الاضافه بنجاح",
                              type: ToastType.success
                          );
                          HiveServices.clearHiveBox<DeliveryEntity>(
                            boxName: HiveServices.kUnAvailableDeliveryBox,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.adminMainLayoutRoute,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddDeliveryLoadingState) {
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

                                AddDeliveryCubit.get(context)
                                    .addUnAvailableDeliveries(
                                      delivery: DeliveryEntity(
                                        completedOrdersNumber: 0,
                                        deliveryId: "",
                                        deliveryLocation:
                                            _locationController.text,
                                        deliveryName: _nameController.text,
                                        deliveryPhone: _phoneController.text,
                                        deliveryRate: rate,
                                        deliveryStatus: "غير متاح",
                                      ),
                                    )
                                    .then((_) {
                                      _nameController.clear();
                                      _phoneController.clear();
                                      _locationController.clear();
                                      _rateController.clear();
                                    });
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
