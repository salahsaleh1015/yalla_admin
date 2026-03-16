import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/core/utils/popup_toast_helper.dart';
import 'package:yalla_admin/data/models/status_badge_model.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/fetching_deliveries_repo.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/delete_delivery_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_available_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_busy_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_card.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_available_deliveries_cubit/fetch_available_deliveries_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_available_deliveries_cubit/fetch_available_deliveries_state.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_busy_deliveries_cubit/fetch_busy_deliveries_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_busy_deliveries_cubit/fetch_busy_deliveries_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

class BusyDeliveriesListView extends StatelessWidget {
  const BusyDeliveriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchBusyDeliveriesCubit>(
      create:
          (context) => FetchBusyDeliveriesCubit(
        FetchBusyDeliveriesUseCase(
          getIt.get<FetchingDeliveriesRepoImpl>(),
        ),

      )..fetchBusyDeliveries(),
      child: BlocBuilder<FetchBusyDeliveriesCubit, FetchBusyDeliveriesStates>(
        builder: (context, state) {
          var cubit = FetchBusyDeliveriesCubit.get(context);
          if (state is FetchBusyDeliveriesSuccessState) {

            return state.busyDeliveries.isNotEmpty
                ? RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await HiveServices.clearHiveBox<DeliveryEntity>(
                  boxName: HiveServices.kBusyDeliveryBox,
                );
                cubit.fetchBusyDeliveries();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPadding.p10,
                        ),
                        child: DeliveryManagementCard(
                          statusBadgeModel: StatusBadgeModel(
                            badgeBackgroundColor:
                            ColorManager.lightPrimary,
                            deliveryStatus: "مشغول",
                            deliveryStatusColor: ColorManager.primary,
                          ),
                          delivery: state.busyDeliveries[index],
                        ),
                      );
                    }, childCount: state.busyDeliveries.length),
                  ),
                ],
              ),
            )
                : NoData();
          } else if (state is FetchAvailableDeliveriesErrorState) {
            return Text("حدث خطأ ما حاول في وقت لاحق");

          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
