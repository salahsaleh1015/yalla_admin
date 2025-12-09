import 'package:convex_bottom_bar/convex_bottom_bar.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_account/views/admin_account_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/views/admin_delivery_management_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_home_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_order_management/views/admin_order_management_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_quick_add/views/admin_addition_view.dart';
part 'admin_main_layout_state.dart';

class AdminMainLayoutCubit extends Cubit<AdminMainLayoutState> {
  AdminMainLayoutCubit() : super(AdminMainLayoutInitial());

  static AdminMainLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;


  void changeIndex(int index) {
    currentIndex = index;
    emit(AdminMainLayoutChangeBottomNavState());
  }


  List<TabItem> adminBottomNavTabs = [
    const TabItem(icon: FontAwesomeIcons.house, title: 'الرئيسية'),
    const TabItem(icon: Icons.delivery_dining, title: 'الديلفرات'),
    const TabItem(icon: Icons.add, title: 'اضف'),
    const TabItem(icon:  Icons.file_open_rounded, title: 'الطلبات'),
    const TabItem(icon: Icons.person, title: 'الحساب'),
  ];



  List<Widget> adminScreens = const[
    AdminHomeView(),
    AdminDeliveryManagementView(),
    AdminAdditionView(),
    AdminOrderManagementView(),
    AdminAccountView(),
  ];

}
