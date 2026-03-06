

import 'package:hive_flutter/hive_flutter.dart';
part 'deliveries_number_entity.g.dart';

@HiveType(typeId: 0)
class DeliveriesNumberEntity{

  @HiveField(0)
  final int deliveriesNumber;

  DeliveriesNumberEntity({required this.deliveriesNumber});
}