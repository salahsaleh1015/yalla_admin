import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_main_layout/cubits/admin_main_layout_cubit/admin_main_layout_cubit.dart';
import 'package:yalla_admin/presentation/global_widgets/global_bottom_nav_bar_widget.dart';

class AdminMainLayout extends StatelessWidget {
 const AdminMainLayout({super.key, });

  static String id = 'AdminMainLayout';



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminMainLayoutCubit(),
      child: BlocBuilder<AdminMainLayoutCubit, AdminMainLayoutState>(
        builder: (context, state) {
          var cubit = AdminMainLayoutCubit.get(context);
          return Scaffold(
            body: cubit.adminScreens[ cubit.currentIndex],
            bottomNavigationBar: GlobalBottomNavBarWidget(
              initialActiveIndex: cubit.currentIndex,
              items: cubit.adminBottomNavTabs,
              onTap: (currentIndex) {
                cubit.changeIndex(currentIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
