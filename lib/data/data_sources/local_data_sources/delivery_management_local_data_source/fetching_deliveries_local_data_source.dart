import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchingDeliveriesLocalDataSource {
  List<DeliveryEntity> fetchAvailableDeliveries();
  List<DeliveryEntity> fetchUnAvailableDeliveries();
  List<DeliveryEntity> fetchBusyDeliveries();
}

class FetchingDeliveriesLocalDataSourceImpl
    implements FetchingDeliveriesLocalDataSource {
  @override
  List<DeliveryEntity> fetchAvailableDeliveries() {
    var box = Hive.box<DeliveryEntity>(HiveServices.kAvailableDeliveryBox);
    return box.values.toList();
  }

  @override
  List<DeliveryEntity> fetchBusyDeliveries() {
    var box = Hive.box<DeliveryEntity>(HiveServices.kBusyDeliveryBox);
    return box.values.toList();
  }

  @override
  List<DeliveryEntity> fetchUnAvailableDeliveries() {
    var box = Hive.box<DeliveryEntity>(HiveServices.kUnAvailableDeliveryBox);
    return box.values.toList();
  }
}
