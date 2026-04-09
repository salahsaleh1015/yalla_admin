
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';

class ProblemsAndRecommendationsHeader extends StatelessWidget {
  const ProblemsAndRecommendationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: AppSize.s30.w),
        Text(
          "المشاكل و المقترحات",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        GlobalCircularButtonWidget(
          onTap: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_forward_ios,
        ),
      ],
    );
  }
}
