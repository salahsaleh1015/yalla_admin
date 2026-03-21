abstract class UploadImageStates {}

final class UploadImageInitialState extends UploadImageStates {}

final class UploadImageLoadingState extends UploadImageStates {}


final class UploadImageSuccessState extends UploadImageStates {
  final String imageUrl;

  UploadImageSuccessState({required this.imageUrl});
}

final class UploadImageErrorState extends UploadImageStates {

  final String errorMsg;

  UploadImageErrorState({required this.errorMsg});
}
