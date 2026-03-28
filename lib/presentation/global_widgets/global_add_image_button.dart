import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/upload_image_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/upload_image_cubit/upload_image_cubit.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/upload_image_cubit/upload_image_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import '../../../core/resources/font_manager.dart';
import 'dart:io';

import '../../core/services/dependency_injection_services/service_locator_setup.dart';

class GlobalAddImageButton extends StatefulWidget {
  const GlobalAddImageButton({super.key, required this.onImageUploaded});

  final Function(String imageUrl) onImageUploaded; // 👈 ده المهم

  @override
  State<GlobalAddImageButton> createState() => _GlobalAddImageButtonState();
}

class _GlobalAddImageButtonState extends State<GlobalAddImageButton> {
  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final file = File(image.path);

      _showUploadDialog(file); // 👈 نفتح الدايلوج هنا
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImageFromGallery,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: AppSize.s30.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.camera_alt,
              color: ColorManager.white,
              size: AppSize.s20.sp,
            ),
            Text(
              "إضافة صورة",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.white,
                fontSize: FontSize.s14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUploadDialog(File imageFile) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🔹 Title
                Text(
                  "تأكيد رفع الصورة",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                /// 📷 عرض الصورة بشكل أحلى
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    imageFile,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔼 Bloc
                BlocProvider<UploadImageCubit>(
                  create:
                      (context) => UploadImageCubit(
                        UploadImageUseCase(
                          getIt.get<HomeTransactionsRepoImpl>(),
                        ),
                      ),
                  child: BlocConsumer<UploadImageCubit, UploadImageStates>(
                    listener: (context, state) {
                      if (state is UploadImageErrorState) {
                        showCustomToast(
                          context,
                          "حدث خطأ ما حاول مرة أخرى",
                          type: ToastType.error,
                        );
                      }

                      if (state is UploadImageSuccessState) {
                        showCustomToast(
                          context,
                          "تمت الإضافة بنجاح",
                          type: ToastType.success,
                        );

                        widget.onImageUploaded(state.imageUrl);
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is UploadImageLoadingState) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: GlobalLoadingIndicator(),
                        );
                      }

                      return Row(
                        children: [
                          /// ❌ Cancel
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("إلغاء"),
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// 🔼 Upload Button (Custom)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UploadImageCubit.get(
                                  context,
                                ).uploadImage(file: imageFile);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorManager.primary,
                                      ColorManager.primary.withOpacity(0.7),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.primary.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    "رفع",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
