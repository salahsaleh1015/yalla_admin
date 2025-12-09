
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_grid_vendor_item.dart';

class GlobalGridVendorList extends StatelessWidget {
  const GlobalGridVendorList({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.54,
              crossAxisSpacing: AppSize.s10.w,
              mainAxisSpacing: AppSize.s1.h),
          itemBuilder: (context, index) =>  GlobalGridVendorItem(
            onTap: onTap,
          )),
    );
  }
}
