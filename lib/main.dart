import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/init/app_initializer.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/resources/theme_manager.dart';
import 'package:yalla_admin/core/services/dependency_injection_services/service_locator_setup.dart';
import 'package:yalla_admin/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Step 1: Initialize core dependencies
  await AppInitializer.initCore();

  // hive initialization
 await AppInitializer.initHive();

  // dependency injection
  serviceLocatorSetup();



  // Step 1: Determine the start route
  final startRoute = AppInitializer.getStartRoute();

  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),

      child: YallaAdminApp(startRoute: startRoute),
    ),
  );
}




class YallaAdminApp extends StatelessWidget {
  YallaAdminApp({super.key, required this.startRoute});

  final routeGenerator = RouteGenerator();

  final String startRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: getApplicationTheme(context),
            debugShowCheckedModeBanner: false,
            title: 'Yalla Admin app',
            onGenerateRoute: routeGenerator.getRoute,
            initialRoute: startRoute,
            //initialRoute: Routes.adminMainLayoutRoute,
          ),
    );
  }
}
