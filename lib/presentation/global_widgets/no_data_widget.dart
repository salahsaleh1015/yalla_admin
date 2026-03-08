
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/values_manager.dart';


class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(AssetsManager.noData,
            height: MediaQuery.sizeOf(context).height*0.4,
            width: MediaQuery.sizeOf(context).width*0.3,
          ),
          SizedBox(
            height: AppSize.s20.h,
          ),
          Text("لا توجد معلومات",style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
    );
  }
}