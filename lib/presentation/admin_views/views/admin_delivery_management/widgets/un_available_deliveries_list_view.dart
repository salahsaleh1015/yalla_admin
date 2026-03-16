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
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch__unavailable_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/fetch_available_deliveries_usecase.dart';
import 'package:yalla_admin/domain/usecases/delivery_management_usecases/update_delivery_usecase.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_card.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_available_deliveries_cubit/fetch_available_deliveries_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_available_deliveries_cubit/fetch_available_deliveries_state.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_unavailable_deliveries_cubit/fetch_unavailable_deliveries_cubit.dart';
import 'package:yalla_admin/presentation/controllers/deliveries_management_controllers/fetch_unavailable_deliveries_cubit/fetch_unavailable_deliveries_state.dart';
import 'package:yalla_admin/presentation/global_widgets/global_loading_indicator.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

class UnAvailableDeliveriesListView extends StatelessWidget {
  const UnAvailableDeliveriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchUnavailableDeliveriesCubit>(
      create:
          (context) => FetchUnavailableDeliveriesCubit(
            FetchUnAvailableDeliveriesUseCase(
              getIt.get<FetchingDeliveriesRepoImpl>(),
            ),
          )..fetchUnAvailableDeliveries(),
      child: BlocBuilder<
        FetchUnavailableDeliveriesCubit,
        FetchUnavailableDeliveriesStates
      >(
        builder: (context, state) {
          var cubit = FetchUnavailableDeliveriesCubit.get(context);
          if (state is FetchUnavailableDeliveriesSuccessState) {
            return state.unAvailableDeliveries.isNotEmpty
                ? RefreshIndicator(
                  color: ColorManager.primary,
                  onRefresh: () async {
                    await HiveServices.clearHiveBox<DeliveryEntity>(
                      boxName: HiveServices.kUnAvailableDeliveryBox,
                    );
                    cubit.fetchUnAvailableDeliveries();
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
                                    ColorManager.darkGrayColor,
                                deliveryStatus: "غير متاح",
                                deliveryStatusColor:
                                    ColorManager.lightGrayColor,
                              ),
                              delivery: state.unAvailableDeliveries[index],
                            ),
                          );
                        }, childCount: state.unAvailableDeliveries.length),
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
