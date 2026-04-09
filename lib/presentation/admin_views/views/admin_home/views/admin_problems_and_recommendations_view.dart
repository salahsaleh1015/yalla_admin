import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/fetch_all_recommendations_usecase.dart';

import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/widgets/problems_and_recommendations_tab_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/recommendation_item.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/fetch_all_recommendations_cubit/fetch_all_recommendations_cubit.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/fetch_all_recommendations_cubit/fetch_all_recommendations_state.dart';

import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../../../core/services/hive_services/hive_services.dart';
import '../../../../../data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import '../../../../global_widgets/global_loading_indicator.dart';
import '../../../../global_widgets/no_data_widget.dart';
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


