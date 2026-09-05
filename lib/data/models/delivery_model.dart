import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required super.deliveryId,
    required super.deliveryName,
    required super.deliveryLocation,
    required super.deliveryPhone,
    required super.deliveryRate,
    required super.deliveryStatus,
    required super.completedOrdersNumber,
    required super.deliveryImage,
  });

  factory DeliveryModel.fromEntity(DeliveryEntity entity) {
    return DeliveryModel(
      deliveryId: entity.deliveryId,
      deliveryName: entity.deliveryName,
      deliveryStatus: entity.deliveryStatus,
      deliveryLocation: entity.deliveryLocation,
      deliveryPhone: entity.deliveryPhone,
      deliveryRate: entity.deliveryRate,
      completedOrdersNumber: entity.completedOrdersNumber,
      deliveryImage: entity.deliveryImage
    );
  }

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      deliveryId: json['deliveryId'] ?? '',
      deliveryImage: json['deliveryImage']??'',
      deliveryName: json['deliveryName'],
      deliveryPhone: json['deliveryPhone'],
      deliveryLocation: json['deliveryLocation'],
      deliveryStatus: json['deliveryStatus'],
      deliveryRate: json['deliveryRate'],
      completedOrdersNumber: json['completedOrders']??0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveryId': deliveryId,
      'deliveryName': deliveryName,
      'deliveryPhone': deliveryPhone,
      'deliveryLocation': deliveryLocation,
      'deliveryStatus': deliveryStatus,
      'deliveryRate': deliveryRate,
      'completedOrders':completedOrdersNumber,
      'deliveryImage':deliveryImage
    };
  }
}
