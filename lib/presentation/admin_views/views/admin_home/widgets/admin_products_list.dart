
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_product_item.dart';

class AdminProductsList extends StatelessWidget {
  const AdminProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p10.w, vertical: AppPadding.p10.h),
            itemCount: 10,
            itemBuilder: (context, index) => const AdminProductItem()));
  }
}
