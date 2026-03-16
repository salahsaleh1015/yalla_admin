import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/available_deliveries_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/busy_deliveries_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_cards_list.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/un_available_deliveries_list_view.dart';

class DeliveryManagementTabBarView extends StatelessWidget {
  const DeliveryManagementTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.56,
      child: TabBarView(
        children: [
          AvailableDeliveriesListView(),
          BusyDeliveriesListView(),
          UnAvailableDeliveriesListView(),

        ],
      ),
    );
  }
}
