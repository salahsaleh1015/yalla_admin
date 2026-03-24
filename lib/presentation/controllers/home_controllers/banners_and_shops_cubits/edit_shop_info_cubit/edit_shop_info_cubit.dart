

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/edit_shop_info_cubit/edit_shop_info_state.dart';

class EditShopInfoCubit extends Cubit<EditShopInfoStates> {
  EditShopInfoCubit() : super(EditShopInfoInitialState());

 static EditShopInfoCubit get(context)=>BlocProvider.of(context);
}
