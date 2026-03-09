


import 'package:hive/hive.dart';

part 'order_entity.g.dart';

@HiveType(typeId: 2)
class OrderEntity {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String userLocation;
  @HiveField(2)
  final String userPhone;
  @HiveField(3)
  final String deliveryName;
  @HiveField(4)
  final String orderDetails;
  @HiveField(5)
  final String orderStatus;
  @HiveField(6)
  final String orderRequestTime;
  @HiveField(7)
  final String orderNotes;
  @HiveField(8)
  final String orderId;

  OrderEntity(
      {required this.userName,
        required this.orderId,
        required this.userLocation,
        required this.userPhone,
        required this.deliveryName,
        required this.orderDetails,
        required this.orderStatus,
        required this.orderRequestTime,
        required this.orderNotes});
}