import 'package:flutter/material.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';
import 'package:yalla_admin/presentation/global_widgets/global_custom_animation_widget.dart';

import '../../../../global_widgets/dialogs/delete_problem_dialog.dart';

class ProblemItem extends StatelessWidget {
  const ProblemItem({super.key, required this.index, required this.problem});

  final int index;
  final ProblemEntity problem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GlobalCustomAnimationWidget(
      index: index,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: width * 0.02,
        ),
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: width * 0.03,
              offset: Offset(0, width * 0.01),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔴 الأيقونة
            Container(
              width: width * 0.12,
              height: width * 0.12,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.red.shade400,
                size: width * 0.06,
              ),
            ),

            SizedBox(width: width * 0.03),

            /// 📝 النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problem.problemTitle,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: width * 0.015),

                  Text(
                    problem.problemDetails,
                    style: TextStyle(
                      fontSize: width * 0.035,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: width * 0.025),

                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: width * 0.03,
                        color: Colors.grey,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        "منذ ساعتين",
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: Colors.grey,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: width * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "عاجل",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// 🗑️ زر الحذف
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.shade300,
                size: width * 0.055,
              ),
              onPressed: () {
                deleteProblemDialog(context, problemId: problem.problemId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
