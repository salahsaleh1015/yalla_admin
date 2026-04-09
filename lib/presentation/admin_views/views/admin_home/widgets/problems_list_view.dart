import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/problem_item.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../../../core/services/hive_services/hive_services.dart';
import '../../../../../data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import '../../../../../domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import '../../../../../domain/usecases/problems_and_recommendations_usecases/fetch_all_problems_usecase.dart';
import '../../../../controllers/problems_and_recommendations_controllers/fetch_all_problems_cubit/fetch_all_problems_cubit.dart';
import '../../../../controllers/problems_and_recommendations_controllers/fetch_all_problems_cubit/fetch_all_problems_state.dart';
import '../../../../global_widgets/global_loading_indicator.dart';
import '../../../../global_widgets/no_data_widget.dart';

class ProblemsListView extends StatelessWidget {
  const ProblemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchAllProblemsCubit>(
      create:
          (context) => FetchAllProblemsCubit(
        FetchAllProblemsUseCase(
          getIt.get<ProblemsAndRecommendationsRepoImpl>(),
        ),
      )..fetchAllProblems(),
      child: BlocBuilder<FetchAllProblemsCubit, FetchAllProblemsStates>(
        builder: (context, state) {
          var cubit = FetchAllProblemsCubit.get(context);
          if (state is FetchAllProblemsSuccessState) {
            return state.problems.isNotEmpty
                ? RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await HiveServices.clearHiveBox<ProblemEntity>(
                  boxName: HiveServices.kProblemsBox,
                );
                cubit.fetchAllProblems();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPadding.p10,
                        ),

                        child: ProblemItem(
                          index: index,
                          problem: state.problems[index],
                        ),
                      );
                    }, childCount: state.problems.length),
                  ),
                ],
              ),
            )
                : NoData();
          } else if (state is FetchAllProblemsLoadingState) {
            return Center(child: GlobalLoadingIndicator());
          } else {
            return Text("حدث خطأ ما حاول في وقت لاحق");
          }
        },
      ),
    );
  }
}
