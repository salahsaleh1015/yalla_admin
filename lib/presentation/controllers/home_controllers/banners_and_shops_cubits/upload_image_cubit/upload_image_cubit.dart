import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/upload_image_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/upload_image_cubit/upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageStates> {
  UploadImageCubit(this.uploadImageUseCase) : super(UploadImageInitialState());
  UploadImageUseCase uploadImageUseCase;

  static UploadImageCubit get(context) => BlocProvider.of(context);

  Future<void> uploadImage({required File file}) async {
    emit(UploadImageLoadingState());

    var result = await uploadImageUseCase.call(file);

    result.fold(
      (failure) {
        emit(UploadImageErrorState(errorMsg: failure.message));
      },
      (imagePath) {
        print(file.path);
        emit(UploadImageSuccessState(imageUrl: imagePath));
      },
    );
  }
}
