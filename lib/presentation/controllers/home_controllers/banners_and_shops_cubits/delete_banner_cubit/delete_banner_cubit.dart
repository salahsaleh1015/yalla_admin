import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/home_transactions_usecases.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_banner_cubit/delete_banner_state.dart';

class DeleteBannerCubit extends Cubit<DeleteBannerStates> {
  DeleteBannerCubit(this.deleteBannerUseCase)
    : super(DeleteBannerInitialState());

  DeleteBannerUseCase deleteBannerUseCase;
  static DeleteBannerCubit get(context) => BlocProvider.of(context);

  Future<void> deleteBanner({required DeleteBannerModelForDomain deleteBannerModel}) async {
    emit(DeleteBannerLoadingState());

    var result = await deleteBannerUseCase.call(deleteBannerModel);

    result.fold(
      (failure) {
        emit(DeleteBannerErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(DeleteBannerSuccessState());

      },
    );
  }
}
