

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

abstract class FetchingOrdersLocalDataSource {
  List<OrderEntity> fetchPendingOrders();
  List<OrderEntity> fetchCanceledOrders();
  List<OrderEntity> fetchCompletedOrders();
  List<OrderEntity> fetchAcceptedOrders();
}

class FetchingOrdersLocalDataSourceImpl
    implements FetchingOrdersLocalDataSource {


  @override
  List<OrderEntity> fetchAcceptedOrders() {
    var box = Hive.box<OrderEntity>(HiveServices.kAcceptedOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchPendingOrders() {
    var box = Hive.box<OrderEntity>(HiveServices.kPendingOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchCanceledOrders() {
    var box = Hive.box<OrderEntity>(HiveServices.kCanceledOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchCompletedOrders() {
    var box = Hive.box<OrderEntity>(HiveServices.kCompletedOrdersBox);
    return box.values.toList();
  }

}