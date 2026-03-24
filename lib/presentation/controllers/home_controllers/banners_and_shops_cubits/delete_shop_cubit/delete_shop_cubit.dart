

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/home_controllers/banners_and_shops_cubits/delete_shop_cubit/delete_shop_state.dart';

class DeleteShopCubit extends Cubit<DeleteShopStates> {
  DeleteShopCubit() : super(DeleteShopInitialState());

 static DeleteShopCubit get(context)=>BlocProvider.of(context);

}
