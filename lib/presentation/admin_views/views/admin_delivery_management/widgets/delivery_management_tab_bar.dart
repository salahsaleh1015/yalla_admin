
import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/global_widgets/global_tab_bar.dart';

class DeliveryManagementTabBar extends StatelessWidget {
  const DeliveryManagementTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GlobalTabBar(tabs: [
      Tab(
        text: "الكل",
      ),
      Tab(
        text: "متاح",
      ),
      Tab(
        text: "مشغول",
      ),
      Tab(
        text: "غير متاح",
      ),
    ]);
  }
}
