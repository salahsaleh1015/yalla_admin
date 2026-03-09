

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_cancelled_orders_cubit/fetch_cancelled_orders_state.dart';

class FetchCancelledOrdersCubit extends Cubit<FetchCancelledOrdersStates> {
  FetchCancelledOrdersCubit() : super(FetchCancelledOrdersInitialState());
}
