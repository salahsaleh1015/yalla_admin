

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_shop_image_cubit/edit_shop_image_state.dart';

class EditShopImageCubit extends Cubit<EditShopImageStates> {
  EditShopImageCubit() : super(EditShopImageInitialState());

  static EditShopImageCubit get(context)=>BlocProvider.of(context);
}
