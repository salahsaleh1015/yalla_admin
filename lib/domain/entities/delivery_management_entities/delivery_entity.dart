import 'package:hive_flutter/hive_flutter.dart';


part 'delivery_entity.g.dart';

@HiveType(typeId: 3)
class DeliveryEntity {
  @HiveField(0)
  final String deliveryId;
  @HiveField(1)
  final String deliveryLocation;
  @HiveField(2)
  final String deliveryName;
  @HiveField(3)
  final String deliveryPhone;
  @HiveField(4)
  final num deliveryRate;
  @HiveField(5)
  final String deliveryStatus;

  DeliveryEntity({
    required this.deliveryId,
    required this.deliveryLocation,
    required this.deliveryName,
    required this.deliveryPhone,
    required this.deliveryRate,
    required this.deliveryStatus,
  });
}
