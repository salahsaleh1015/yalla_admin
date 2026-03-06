import 'package:hive_flutter/hive_flutter.dart';
part 'completed_orders_number_entity.g.dart';

@HiveType(typeId: 1)
class CompletedOrdersNumberEntity {
  @HiveField(0)
  final int completedOrdersNumber;

  CompletedOrdersNumberEntity({required this.completedOrdersNumber});
}
