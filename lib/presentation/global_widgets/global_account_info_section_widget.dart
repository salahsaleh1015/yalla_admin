
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_user_card_widget.dart';



class GlobalAccountInfoSectionWidget extends StatelessWidget {
  const GlobalAccountInfoSectionWidget({super.key, required this.userName, required this.joinDate});

  final String userName;
  final String joinDate;
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        const GlobalUserCardWidget(
          radius: AppSize.s80, // screen util added inside the widget
        ),
        SizedBox(
          width: AppSize.s10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName,style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: AppSize.s5.h,),
            Text(joinDate,style: Theme.of(context).textTheme.headlineSmall,),
          ],
        )
      ],
    );
  }
}
