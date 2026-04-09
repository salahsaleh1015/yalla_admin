import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/recommendation_item.dart';
import 'package:yalla_admin/presentation/global_widgets/no_data_widget.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../../../core/services/hive_services/hive_services.dart';
import '../../../../../data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import '../../../../../domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import '../../../../../domain/usecases/problems_and_recommendations_usecases/fetch_all_recommendations_usecase.dart';
import '../../../../controllers/problems_and_recommendations_controllers/fetch_all_recommendations_cubit/fetch_all_recommendations_cubit.dart';
import '../../../../controllers/problems_and_recommendations_controllers/fetch_all_recommendations_cubit/fetch_all_recommendations_state.dart';
import '../../../../global_widgets/global_loading_indicator.dart';

class RecommendationsListView extends StatelessWidget {
  const RecommendationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<FetchAllRecommendationsCubit>(
      create:
          (context) => FetchAllRecommendationsCubit(
        FetchAllRecommendationsUseCase(
          getIt.get<ProblemsAndRecommendationsRepoImpl>(),
        ),
      )..fetchAllRecommendations(),
      child: BlocBuilder<FetchAllRecommendationsCubit, FetchAllRecommendationsStates>(
        builder: (context, state) {
          var cubit = FetchAllRecommendationsCubit.get(context);
          if (state is FetchAllRecommendationsSuccessState) {
            return state.recommendations.isNotEmpty
                ? RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await HiveServices.clearHiveBox<RecommendationEntity>(
                  boxName: HiveServices.kRecommendationsBox,
                );
                cubit.fetchAllRecommendations();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPadding.p10,
                        ),

                        child: RecommendationItem(
                          index: index,
                          recommendation: state.recommendations[index],
                        ),
                      );
                    }, childCount: state.recommendations.length),
                  ),
                ],
              ),
            )
                : NoData();
          } else if (state is FetchAllRecommendationsLoadingState) {
            return Center(child: GlobalLoadingIndicator());
          } else {
            return Text("حدث خطأ ما حاول في وقت لاحق");
          }
        },
      ),
    );
  }
}
