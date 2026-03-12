import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/global_widgets/global_tab_bar.dart';

class AdminOrderManagementTabBar extends StatelessWidget {
  const AdminOrderManagementTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GlobalTabBar(tabs: [
      Tab(
        text: "معلق",
      ),
      Tab(
        text: "جاري",
      ),
      Tab(
        text: "ملغي",
      ),
      Tab(
        text: "مكتمل",
      ),
    ]);
  }
}
