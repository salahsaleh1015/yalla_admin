import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_cancelled_orders_usecae.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_card.dart';

import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_cancelled_orders_cubit/fetch_cancelled_orders_cubit.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_cancelled_orders_cubit/fetch_cancelled_orders_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

import '../../../../../data/repos/orders_management_repo/fetch_orders_repo.dart';

class CancelledOrdersListView extends StatelessWidget {
  const CancelledOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchCancelledOrdersCubit>(
      create:
          (context) => FetchCancelledOrdersCubit(
            FetchCancelledOrdersUseCase(getIt.get<FetchOrdersRepoImpl>()),
          )..fetchCancelledOrders(),
      child: BlocBuilder<FetchCancelledOrdersCubit, FetchCancelledOrdersStates>(
        builder: (context, state) {
          var cubit = FetchCancelledOrdersCubit.get(context);
          if (state is FetchCancelledOrdersSuccessState) {
            return state.cancelledOrders.isEmpty
                ? NoData()
                : RefreshIndicator(
                  color: ColorManager.primary,
                  onRefresh: () async {
                    await HiveServices.clearHiveBox<OrderEntity>(
                      boxName: HiveServices.kCanceledOrdersBox,
                    );
                    cubit.fetchCancelledOrders();
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return OrderManagementCard(
                         orderIndex: index,
                            order: state.cancelledOrders[index],
                          );
                        }, childCount: state.cancelledOrders.length),
                      ),
                    ],
                  ),
                );
          } else if (state is FetchCancelledOrdersErrorState) {
            return Text("حدث خطأ ما حاول في وقت لاحق");
          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
