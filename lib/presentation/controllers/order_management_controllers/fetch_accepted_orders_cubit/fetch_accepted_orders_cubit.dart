

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_accepted_orders_cubit/fetch_accepted_orders_state.dart';

class FetchAcceptedOrdersCubit extends Cubit<FetchAcceptedOrdersStates> {
  FetchAcceptedOrdersCubit() : super(FetchAcceptedOrdersInitialState());
}
