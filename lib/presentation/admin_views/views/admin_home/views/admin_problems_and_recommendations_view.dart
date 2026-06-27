import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';

import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/problems_and_recommendations_tab_bar.dart';

import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

import '../../admin_delivery_management/widgets/problems_and_recommendations_header.dart';
import '../widgets/problems_list_view.dart';
import '../widgets/recommendations_list_view.dart';

class AdminProblemsAndRecommendationsView extends StatelessWidget {
  const AdminProblemsAndRecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: GlobalPaddingWidget(
          child: Column(
            children: [
              ProblemsAndRecommendationsHeader(),
              SizedBox(height: AppSize.s30.h),
              ProblemsAndRecommendationsTabBar(),
              SizedBox(height: AppSize.s15.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(children: [ProblemsListView(), RecommendationsListView()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


