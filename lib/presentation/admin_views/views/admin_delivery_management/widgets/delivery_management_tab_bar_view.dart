

import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/delivery_management_cards_list.dart';


class DeliveryManagementTabBarView extends StatelessWidget {
  const DeliveryManagementTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.of(context).size.height * 0.56,
      child:  TabBarView(children:[
        DeliveryManagementCardsList(
          deliveryStatusColor: ColorManager.white,
          deliveryStatus: "الكل",
          statusColor: ColorManager.primary,
        ),
        const DeliveryManagementCardsList(
          deliveryStatusColor: Colors.green,
          deliveryStatus: "متاح",
          statusColor: Color(0xFFcff7d1),
        ),
        DeliveryManagementCardsList(
          deliveryStatusColor: ColorManager.primary,
          deliveryStatus: "مشغول",
          statusColor: const Color(0xFFffe1d8),
        ),
        DeliveryManagementCardsList(
          statusColor: ColorManager.inputFillColor,
          deliveryStatus: "غير متاح",
          deliveryStatusColor: ColorManager.darkGrayColor,
        ),

      ]
      ),
    );
  }
}
