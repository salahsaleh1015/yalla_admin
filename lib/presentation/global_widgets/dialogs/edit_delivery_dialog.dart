import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/constants_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/update_delivery_cubit/update_delivery_cubit.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/global_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_text_field_widget.dart';

void editDeliveryDialog(
  BuildContext context, {
  required DeliveryEntity delivery,
}) {
  showCustomDialog(
    context,
    content: EditDeliveryDialogContent(delivery: delivery),
    dialogTitle: "تعديل البيانات",
    actionButtonHint: "حفظ",
  );
}

class EditDeliveryDialogContent extends StatefulWidget {
  const EditDeliveryDialogContent({super.key, required this.delivery});

  final DeliveryEntity delivery;

  @override
  State<EditDeliveryDialogContent> createState() =>
      _EditDeliveryDialogContentState();
}

class _EditDeliveryDialogContentState extends State<EditDeliveryDialogContent> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _nameController.text.isNotEmpty ||
        _phoneController.text.isNotEmpty ||
        _locationController.text.isNotEmpty;
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
  }

  num rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateDeliveryCubit>(
      create:
          (context) => UpdateDeliveryCubit(
            UpdateDeliveriesUseCase(getIt.get<ActionsOfDeliveriesRepoImpl>()),
          ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أسم مندوب التوصيل",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            buildSmallSpace(),
            GlobalTextFieldWidget(
              controller: _nameController,
              validator: (String? value) {
                if (value!.length < 5) {
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
              validator: (String? val) {
                if (val!.isEmpty) {
                  return "ادخل القيمه الصحيحه";
                }
                return null;
              },
              onSaved: (val) {
                rate = val as num;
              },
              textInputType: TextInputType.number,
              hintText: "ادخل تقييم المندوب من 1 الي 5",
            ),
            buildSpace(),
            Padding(
              padding: EdgeInsets.all(AppSize.s2.r),
              child: GlobalButtonWidget(
                isButtonEnabled: true,
                height: AppSize.s40.h,
                color: ColorManager.error,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    UpdateDeliveryCubit.get(context).updateDeliveries(
                      delivery: DeliveryEntity(
                        deliveryId: widget.delivery.deliveryId,
                        deliveryLocation: _locationController.text,
                        deliveryName: _nameController.text,
                        deliveryPhone: _phoneController.text,
                        deliveryRate: rate,
                        deliveryStatus: widget.delivery.deliveryStatus,
                      ),
                    );
                  }
                },
                width: MediaQuery.of(context).size.width * 0.8,
                text: "إلغاء الطلب",
              ),
            ),
          ],
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
