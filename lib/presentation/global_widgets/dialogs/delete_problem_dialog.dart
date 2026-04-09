import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import 'package:yalla_admin/domain/usecases/problems_and_recommendations_usecases/delete_usecases.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_problem_cubit/delete_problem_cubit.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_problem_cubit/delete_problem_state.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_recommendations_cubit/delete_recommendations_cubit.dart';
import 'package:yalla_admin/presentation/controllers/problems_and_recommendations_controllers/delete_recommendations_cubit/delete_recommendations_state.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/services/dependency_injection_services/service_locator_setup.dart';
import '../../../core/services/hive_services/hive_services.dart';
import '../../../core/utils/popup_toast_helper.dart';
import '../global_button_widget.dart';
import '../global_loading_indicator.dart';
import 'global_dialog.dart';

void deleteProblemDialog(
    BuildContext context, {
      required String problemId,
    }) {
  showCustomDialog(
    context,
    dialogTitle: "مسح المشكله",

    actionButtonColor: ColorManager.error,
    actionButtonHint: "مسح المشكله",

    content: DeleteProblemDialog(problemId: problemId),
  );
}

class DeleteProblemDialog extends StatelessWidget {
  const DeleteProblemDialog({super.key, required this.problemId});

  final String problemId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteProblemCubit>(
      create:
          (context) => DeleteProblemCubit(
            DeleteProblemUseCase(getIt.get<ProblemsAndRecommendationsRepoImpl>()),
      ),
      child: BlocConsumer<DeleteProblemCubit, DeleteProblemStates>(
        listener: (context, state) async {
          if (state is DeleteProblemSuccessState) {
            showCustomToast(
              context,
              "تم مسح  بنجاح",
              type: ToastType.success,
            );
            await HiveServices.clearHiveBox<ProblemEntity>(
              boxName: HiveServices.kProblemsBox,
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
                    DeleteProblemCubit.get(context).deleteProblem(
                      problemId: problemId,
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




