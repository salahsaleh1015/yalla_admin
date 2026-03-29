import 'package:hive/hive.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';

abstract class HomeStatisticsCardsLocalDataSource {
  int getTheNumberOfDeliveries();
  int getTheNumberOfCompletedOrders();
  int getTheNumberOfUsers();
}

class HomeStatisticsCardsLocalDataSourceImpl
    implements HomeStatisticsCardsLocalDataSource {
  @override
  int getTheNumberOfCompletedOrders() {
    var box = Hive.box<int>(HiveServices.kCompletedOrdersNumberBox);

    // return box.get(HiveServices.kCompletedOrdersNumberBoxKey,)
    //     as int;

    return box.get(HiveServices.kCompletedOrdersNumberBoxKey) ?? 0;
  }

  @override
  int getTheNumberOfDeliveries() {
    var box = Hive.box<int>(HiveServices.kDeliveryNumbersBox);

    return box.get(HiveServices.kDeliveryNumbersBoxKey) ?? 0;
  }

  @override
  int getTheNumberOfUsers() {
    var box = Hive.box<int>(HiveServices.kUsersNumberBox);

    return box.get(HiveServices.kUsersNumberBoxKey) ?? 0;
  }
}
