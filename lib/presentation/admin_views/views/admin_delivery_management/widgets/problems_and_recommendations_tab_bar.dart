import 'package:flutter/material.dart';

import '../../../../global_widgets/global_tab_bar.dart';

class ProblemsAndRecommendationsTabBar extends StatelessWidget {
  const ProblemsAndRecommendationsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalTabBar(tabs: [Tab(text: "مشاكل"), Tab(text: "مقترحات")]);
  }
}
