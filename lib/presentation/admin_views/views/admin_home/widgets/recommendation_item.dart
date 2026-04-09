
import 'package:flutter/material.dart';
import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/delete_recommendation_dialog.dart';
import 'package:yalla_admin/presentation/global_widgets/global_custom_animation_widget.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({super.key, required this.index, required this.recommendation});

  final int index;
  final RecommendationEntity recommendation;
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
              color: Colors.black.withOpacity(0.06),
              blurRadius: width * 0.03,
              offset: Offset(0, width * 0.01),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 💡 أيقونة المقترح
            Container(
              width: width * 0.12,
              height: width * 0.12,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: Icon(
                Icons.lightbulb_outline,
                color: Colors.green.shade500,
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
                    recommendation.recommendationTitle,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: width * 0.015),

                  Text(
                  recommendation.recommendationDetails,
                    style: TextStyle(
                      fontSize: width * 0.035,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: width * 0.025),

                  Row(
                    children: [


                      const Spacer(),

                      /// 🟢 لابل المقترح
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: width * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "مقترح",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// 🗑️ حذف
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.grey.shade400,
                size: width * 0.055,
              ),
              onPressed: () {
                deleteRecommendationDialog(context,recommendationId: recommendation.recommendationId);
              },
            ),
          ],
        ),
      ),
    );
  }
}