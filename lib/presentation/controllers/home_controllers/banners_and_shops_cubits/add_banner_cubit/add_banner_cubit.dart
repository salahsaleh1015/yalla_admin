import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/add_banner_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/add_banner_cubit/add_banner_state.dart';

class AddBannerCubit extends Cubit<AddBannerStates> {
  AddBannerCubit(this.addBannerUseCase) : super(AddBannerInitialState());

  static AddBannerCubit get(context) => BlocProvider.of(context);

  AddBannerUseCase addBannerUseCase;

  Future<void> addBanner({required HomeBannerEntity banner}) async {
    emit(AddBannerLoadingState());

    var result = await addBannerUseCase.call(banner);

    result.fold(
      (failure) {
        emit(AddBannerErrorState(errorMsg: failure.message));
      },
      (deliveries) {
        emit(AddBannerSuccessState());
      },
    );
  }
}
