



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/usecases/home_usecases/get_banners_usecase.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_banners_cubit/get_banners_state.dart';

class GetBannersCubit extends Cubit<GetBannersStates> {
  GetBannersCubit(this.getBannersUseCase) : super(GetBannersInitialState());

  static GetBannersCubit get(context) => BlocProvider.of(context);

  GetBannersUseCase getBannersUseCase ;

  Future<void> fetchBanners() async {
    emit(GetBannersLoadingState());
    var result = await getBannersUseCase.call();
    result.fold((failure) {
      emit(GetBannersErrorState(errorMessage: failure.message));
    }, (banners) {
      emit(GetBannersLoadedState( bannersList: banners));
    });
  }
}