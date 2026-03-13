import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  String? id;
  String? name;
  String? phone;
  String? location;
  String? status;
  num? rate;
  String? mail;
  String? password;

  DeliveryModel({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.status,
    this.rate,
    this.mail,
    this.password,
  }) : super(
         deliveryName: name ?? "الاسم مفقود او غير صحيح",
         deliveryStatus: status ?? "الحالة مفقودة او غير صحيح",
         deliveryLocation: location ?? "العنوان مفقود او غير صحيح",
         deliveryPhone: phone ?? "رقم الهاتف مفقود او غير صحيح",
         deliveryRate: rate ?? 0.0,
         deliveryId: id ?? '',
       );



  factory DeliveryModel.fromEntity(DeliveryEntity entity) {
    return DeliveryModel(
      id: entity.deliveryId,
      name: entity.deliveryName,
      status: entity.deliveryStatus,
      location:entity.deliveryLocation,
      phone: entity.deliveryPhone,
      rate: entity.deliveryRate,
    );
  }

  /// 🔹 Factory constructor to create an instance from Firestore/JSON
  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['deliveryId'],
      name: json['deliveryName'],
      phone: json['deliveryPhone'],
      location: json['deliveryLocation'],
      status: json['deliveryStatus'],
      rate: json['deliveryRate'],
      mail: json['deliveryMail'],
      password: json['deliveryPassword'],
    );
  }

  /// 🔹 Convert model to JSON for saving in Firestore or APIs
  Map<String, dynamic> toJson() {
    return {
      'deliveryId': id,
      'deliveryName': name,
      'deliveryPhone': phone,
      'deliveryLocation': location,
      'deliveryStatus': status,
      'deliveryRate': rate,
      'deliveryMail': mail,
      'deliveryPassword': password,
    };
  }
}
