import 'package:firebase_core/firebase_core.dart';
import 'package:yalla_admin/core/resources/routes_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/firebase_options.dart';

class AppInitializer {
  static Future<void> initCore() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static String getStartRoute() {
    return Routes.adminAuthenticationRoute;
  }

  static Future<void> initHive() async{
   await HiveServices.initHive();
  }
}
