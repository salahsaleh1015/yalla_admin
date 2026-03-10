import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/accepted_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/all_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/cancelled_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/completed_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_cards_list.dart';

import '../../../../../core/resources/colors_manager.dart';

class AdminOrderManagementTabBarView extends StatelessWidget {
  const AdminOrderManagementTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          AllOrdersListView(),
          AcceptedOrdersListView(),
          CancelledOrdersListView(),
          CompletedOrdersListView(),
        ],
      ),
    );
  }
}
