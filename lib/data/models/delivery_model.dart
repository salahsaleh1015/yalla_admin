import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required super.deliveryId,
    required super.deliveryName,
    required super.deliveryLocation,
    required super.deliveryPhone,
    required super.deliveryRate,
    required super.deliveryStatus,
    required super.completedOrdersNumber
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
    );
  }

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      deliveryId: json['deliveryId'] ?? '',
      deliveryName: json['deliveryName'],
      deliveryPhone: json['deliveryPhone'],
      deliveryLocation: json['deliveryLocation'],
      deliveryStatus: json['deliveryStatus'],
      deliveryRate: json['deliveryRate'],
      completedOrdersNumber: json['completedOrdersNumber']
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
      'completedOrdersNumber':completedOrdersNumber
    };
  }
}
