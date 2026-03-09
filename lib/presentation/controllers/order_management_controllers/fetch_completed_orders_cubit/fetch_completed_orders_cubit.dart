

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_completed_orders_cubit/fetch_completed_orders_state.dart';

class FetchCompletedOrdersCubit extends Cubit<FetchCompletedOrdersStates> {
  FetchCompletedOrdersCubit() : super(FetchCompletedOrdersInitialState());
}
