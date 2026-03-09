



import 'package:yalla_admin/domain/entities/order_management_entities/order_entity.dart';

class OrderModelData extends OrderEntity {
  String? name;
  String? userPhoneNumber;
  String? location;
  String? userOrder;
  String? userOrderId;
  String? userOrderStatus;
  String? userOrderNotes;

  String? userOrderDate;
  String? myName;
  String? deliveryPhone;
  String? deliveryLocation;
  String? deliveryStatus;
  int? deliveryRate;
  String? deliveryMail;

  OrderModelData({
    this.userOrderId,
    required this.name,
    required this.userPhoneNumber,
    required this.location,
    required this.userOrder,
    required this.userOrderStatus,
    required this.userOrderNotes,

    required this.userOrderDate,
    required this.myName,
    required this.deliveryPhone,
    required this.deliveryLocation,
    required this.deliveryStatus,
    required this.deliveryRate,
    required this.deliveryMail,
  }) : super(
    userLocation: location ?? '',
    orderDetails: userOrder ?? '',
    orderRequestTime: userOrderDate ?? '',
    userPhone: userPhoneNumber ?? '',
    orderStatus: userOrderStatus ?? '',
    userName: name ?? '',
    orderNotes: userOrderNotes ?? '',
    deliveryName: myName ?? '',
    orderId: userOrderId ?? '',
  );

  // Create an OrderModel from JSON
  factory OrderModelData.fromJson(Map<String, dynamic> json) {
    return OrderModelData(
      userOrderId: json['userOrderId'],
      name: json['userName'],
      userPhoneNumber: json['userPhoneNumber'],
      location: json['userLocation'],
      userOrder: json['userOrder'],
      userOrderStatus: json['userOrderStatus'],
      userOrderNotes: json['userOrderNotes'],

      userOrderDate: json['userOrderDate'],
      myName: json['deliveryName'],
      deliveryPhone: json['deliveryPhone'],
      deliveryLocation: json['deliveryLocation'],
      deliveryStatus: json['deliveryStatus'],
      deliveryRate: json['deliveryRate'],
      deliveryMail: json['deliveryMail'],
    );
  }

  // Convert the OrderModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'userLocation': userLocation,
      'userOrder': userOrder,
      'userOrderStatus': userOrderStatus,
      'userOrderId': userOrderId,
      'userOrderNotes': userOrderNotes,

      'userOrderDate': userOrderDate,
      'deliveryName': deliveryName,
      'deliveryPhone': deliveryPhone,
      'deliveryLocation': deliveryLocation,
      'deliveryStatus': deliveryStatus,
      'deliveryRate': deliveryRate,
      'deliveryMail': deliveryMail,
    };
  }
}