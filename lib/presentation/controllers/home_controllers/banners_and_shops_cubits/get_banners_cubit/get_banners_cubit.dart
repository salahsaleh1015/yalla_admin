



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/get_banners_cubit/get_banners_state.dart';

import '../../../../../domain/usecases/home_usecases/home_transactions_usecases.dart';

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