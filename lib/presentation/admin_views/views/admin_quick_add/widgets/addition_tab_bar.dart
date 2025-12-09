import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/global_widgets/global_tab_bar.dart';

class AdditionTabBar extends StatelessWidget {
  const AdditionTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalTabBar(
      tabs: [
        Tab(
          text: "إضافة موزع خدمة",
        ),
        Tab(
          text: "إضافة مندوب توصيل",
        ),
      ],
    );
  }
}

