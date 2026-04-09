import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../core/services/hive_services/hive_services.dart';
import '../../../core/utils/popup_toast_helper.dart';
import '../../../data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import '../../../domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import '../../../domain/usecases/problems_and_recommendations_usecases/delete_usecases.dart';
import '../../controllers/problems_and_recommendations_controllers/delete_problem_cubit/delete_problem_state.dart';
import '../../controllers/problems_and_recommendations_controllers/delete_recommendations_cubit/delete_recommendations_cubit.dart';
import '../../controllers/problems_and_recommendations_controllers/delete_recommendations_cubit/delete_recommendations_state.dart';
import '../global_button_widget.dart';
import '../global_loading_indicator.dart';
import 'global_dialog.dart';

void deleteRecommendationDialog(
    BuildContext context, {
      required String recommendationId,
    }) {
  showCustomDialog(
    context,
    dialogTitle: "مسح المفترح",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "مسح المفترح",

    content: DeleteRecommendationDialog(recommendationId: recommendationId),
  );
}

class DeleteRecommendationDialog extends StatelessWidget {
  const DeleteRecommendationDialog({super.key, required this.recommendationId});

  final String recommendationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteRecommendationsCubit>(
      create:
          (context) => DeleteRecommendationsCubit(
        DeleteRecommendationUseCase(getIt.get<ProblemsAndRecommendationsRepoImpl>()),
      ),
      child: BlocConsumer<DeleteRecommendationsCubit, DeleteRecommendationsStates>(
        listener: (context, state) async {
          if (state is DeleteRecommendationsSuccessState) {
            showCustomToast(
              context,
              "تم مسح  بنجاح",
              type: ToastType.success,
            );
            await HiveServices.clearHiveBox<RecommendationEntity>(
              boxName: HiveServices.kRecommendationsBox,
            );
            Navigator.pushReplacementNamed(
              context,
              Routes.adminMainLayoutRoute,
            );
          }
          if (state is DeleteProblemErrorState) {
            showCustomToast(context, "حدث خطا ما", type: ToastType.error);
          }
        },
        builder: (context, state) {
          return state is DeleteProblemLoadingState
              ? Center(child: GlobalLoadingIndicator())
              : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSize.s10.h),
              Text(
                "هل أنت متأكد أنك تريد المسح ؟",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorManager.hintColor,
                ),
              ),
              SizedBox(height: AppSize.s10.h),
              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalButtonWidget(
                  isButtonEnabled: true,
                  height: AppSize.s40.h,
                  color: ColorManager.error,
                  onTap: () {
                    DeleteRecommendationsCubit.get(context).deleteRecommendation(
                      recommendationId: recommendationId,
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  text: "إلغاء ",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
