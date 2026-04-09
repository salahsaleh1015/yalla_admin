
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_authentication/views/admin_authentication.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/views/admin_add_delivery_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/views/admin_delivery_management_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_banner_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_product_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_shop_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_banner_details_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_home_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_vendors_details_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_main_layout/views/admin_main_layout.dart';

import '../../presentation/admin_views/views/admin_home/views/admin_problems_and_recommendations_view.dart';

class AppPageRoute extends PageRouteBuilder {
  final Widget child;

  AppPageRoute({required this.child})
      : super(
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      );

      // Slide (من تحت لفوق بسيط)
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
      );

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: child,
        ),
      );
    },
  );
}






class Routes {

  // Admin routes
  static const String adminMainLayoutRoute = "/adminMainLayout";
  static const String adminAdditionRoute = "/adminAddition";
  static const String adminAccountRoute = "/adminAccount";
  static const String adminEditAccountRoute = "/adminEditAccount";
  static const String adminAddAdsRoute = "/adminAddAds";
  static const String adminDeliveryManagementRoute = "/adminDeliveryManagement";
  static const String adminAddDeliveryRoute = "/adminAddDelivery";
  static const String adminHomeRoute = "/adminHome";
  static const String adminBannerDetailsRoute = "adminBannerDetails";
  static const String adminVendorDetailsRoute = "/adminVendorDetails";
  static const String adminAddVendorRoute = "/adminAddVendor";
  static const String adminAuthenticationRoute = "/adminAuthentication";
  static const String adminAddBannerRoute = "/adminAddBanner";
  static const String adminAddShopRoute = "/adminAddShop";
  static const String adminAddShopProductRoute = "/adminAddShopProduct";
  static const String adminProblemsAndRecommendationsRoute = "/adminProblemsAndRecommendationsRoute";




}

class RouteGenerator {


  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.adminAuthenticationRoute:
        return AppPageRoute(child:  AdminAuthenticationView());
      // Admin routes
      case Routes.adminMainLayoutRoute:

        return AppPageRoute(child: AdminMainLayout(

     ));

      case Routes.adminDeliveryManagementRoute:
        return AppPageRoute(child: const AdminDeliveryManagementView());
      case Routes.adminAddDeliveryRoute:
        return AppPageRoute(child:AdminAddDeliveryView());
      case Routes.adminHomeRoute:
        return AppPageRoute(child: const AdminHomeView());
      case Routes.adminVendorDetailsRoute:
        final args = settings.arguments as HomeShopEntity;
        return AppPageRoute(child:  AdminVendorDetailsView(
              shop: args,
            ));

      case Routes.adminBannerDetailsRoute:
        final args = settings.arguments as HomeBannerEntity;
        return AppPageRoute(child:BannerDetailsView(
          banner: args,
        ));
      case Routes.adminAddShopRoute: /////
        return AppPageRoute(child:AdminAddShopView());
      case Routes.adminAddShopProductRoute:
      final args = settings.arguments as String;
        return AppPageRoute(child:AdminAddProductView(
          shopId:args,
        ));
      case Routes.adminAddBannerRoute:
        return AppPageRoute(child:AdminAddBannerView());


      case Routes.adminProblemsAndRecommendationsRoute:
        return AppPageRoute(child:  AdminProblemsAndRecommendationsView());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return AppPageRoute(child: Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("Route not defined")),
      ),
    );
  }
}
