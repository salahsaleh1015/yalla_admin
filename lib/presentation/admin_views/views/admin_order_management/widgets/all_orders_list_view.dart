import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';
import 'package:yalla_admin/domain/repos/order_management_repos/fetching_orders_repo.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_accepted_orders_usecase.dart';
import 'package:yalla_admin/domain/usecases/order_management_usecases/fetch_all_orders_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_card.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_accepted_orders_cubit/fetch_accepted_orders_cubit.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_accepted_orders_cubit/fetch_accepted_orders_state.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_all_orders_cubit/fetch_all_orders_cubit.dart';
import 'package:yalla_admin/presentation/controllers/order_management_controllers/fetch_all_orders_cubit/fetch_all_orders_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

import '../../../../../data/repos/orders_management_repo/fetch_orders_repo.dart';

class AllOrdersListView extends StatelessWidget {
  const AllOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchAllOrdersCubit>(
      create:
          (context) => FetchAllOrdersCubit(
            FetchAllOrdersUseCase(getIt.get<FetchOrdersRepoImpl>()),
      )..fetchAllOrders(),
      child: BlocBuilder<FetchAllOrdersCubit, FetchAllOrdersStates>(
        builder: (context, state) {
          var cubit = FetchAllOrdersCubit.get(context);
          if (state is FetchAllOrdersSuccessState) {
            return state.allOrders.isEmpty
                ? NoData()
                : RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await HiveServices.clearHiveBox<OrderEntity>(
                  boxName: HiveServices.kAllOrdersBox,
                );
                cubit.fetchAllOrders();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return OrderManagementCard(
                     order: state.allOrders[index],
                        orderIndex: index,
                      );
                    }, childCount: state.allOrders.length),
                  ),
                ],
              ),
            );
          } else if (state is FetchAllOrdersErrorState) {
            return Text("حدث خطأ ما حاول في وقت لاحق");
          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
