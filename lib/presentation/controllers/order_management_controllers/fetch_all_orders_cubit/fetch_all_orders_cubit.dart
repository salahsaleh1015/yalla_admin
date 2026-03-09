

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_all_orders_cubit/fetch_all_orders_state.dart';

class FetchAllOrdersCubit extends Cubit<FetchAllOrdersStates> {
  FetchAllOrdersCubit() : super(FetchAllOrdersInitialState());
}
