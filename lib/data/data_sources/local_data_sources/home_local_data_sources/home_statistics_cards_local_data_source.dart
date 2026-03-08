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

    return box.get(HiveServices.kCompletedOrdersNumberBoxKey,)
        as int;

  }

  @override
  int getTheNumberOfDeliveries() {
    var box = Hive.box<int>(HiveServices.kDeliveryNumbersBox);

    return box.get(HiveServices.kDeliveryNumbersBoxKey,) as int;
  }

  @override
  int getTheNumberOfUsers() {
    var box = Hive.box<int>(HiveServices.kUsersNumberBox);

    return box.get(HiveServices.kUsersNumberBoxKey,) as int;
  }
}
