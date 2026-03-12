import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/accepted_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/cancelled_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/completed_orders_list_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/order_management_cards_list.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/widgets/pending_orders_list_view.dart' show PendingOrdersListView;

import '../../../../../core/resources/colors_manager.dart';

class AdminOrderManagementTabBarView extends StatelessWidget {
  const AdminOrderManagementTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          PendingOrdersListView(),
          AcceptedOrdersListView(),
          CancelledOrdersListView(),
          CompletedOrdersListView(),
        ],
      ),
    );
  }
}
