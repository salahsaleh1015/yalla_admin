
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_authentication/views/admin_authentication.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/views/admin_add_delivery_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_delivery_management/views/admin_delivery_management_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_banner_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_product_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_shop_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_add_vendor_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_banner_details_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_home_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_home/views/admin_vendors_details_view.dart';
import 'package:yalla_admin/presentation/admin_views/views/admin_main_layout/views/admin_main_layout.dart';


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




}

class RouteGenerator {


  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      // Admin routes
      case Routes.adminMainLayoutRoute:

        return MaterialPageRoute(builder: (_) =>  AdminMainLayout(

     ));

      case Routes.adminDeliveryManagementRoute:
        return MaterialPageRoute(
            builder: (_) => const AdminDeliveryManagementView());
      case Routes.adminAddDeliveryRoute:
        return MaterialPageRoute(builder: (_)=>AdminAddDeliveryView());
      case Routes.adminHomeRoute:
        return MaterialPageRoute(builder: (_) => const AdminHomeView());
      case Routes.adminVendorDetailsRoute:
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) =>  AdminVendorDetailsView(
              shopId: args,
            ));
      case Routes.adminAddVendorRoute:
        return MaterialPageRoute(builder: (_) => const AdminAddVendorView());
      case Routes.adminBannerDetailsRoute:
        final args = settings.arguments as HomeBannerEntity;
        return MaterialPageRoute(builder: (_)=>BannerDetailsView(
          banner: args,
        ));
      case Routes.adminAddShopRoute:
        return MaterialPageRoute(builder: (_)=>AdminAddShopView());
      case Routes.adminAddShopProductRoute:
      final args = settings.arguments as String;
        return MaterialPageRoute(builder: (_)=>AdminAddProductView(
          shopId:args,
        ));
      case Routes.adminAddBannerRoute:
        return MaterialPageRoute(builder: (_)=>AdminAddBannerView());
      case Routes.adminAuthenticationRoute:
        return MaterialPageRoute(
            builder: (_) =>  AdminAuthenticationView());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("Route not defined")),
      ),
    );
  }
}
