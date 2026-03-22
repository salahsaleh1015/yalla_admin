


import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';

class ShopModel extends HomeShopEntity {
  String? name;
  String? Id;
  String? address;
  String? phoneNumber;
  String? image;
  num? rate;

  ShopModel(
      {this.name,
        this.phoneNumber,
        this.address,
        this.image,
        this.rate,
        this.Id})
      : super(
      shopAddress: address ?? '',
      shopImage: image ??
          "https://firebasestorage.googleapis.com/v0/b/yalla-delivery-app-f5ce2.firebasestorage.app/o/bannerFourImage.jpeg?alt=media&token=1adf43c1-0958-46ed-b80a-988202f1c543",
      shopName: name ?? 'لا توجد بيانات',
      shopPhoneNumber: phoneNumber ?? 'لا توجد بيانات',
      shopRate: rate ?? 0,
      shopId: Id ?? '');


  factory ShopModel.fromEntity(HomeShopEntity shopEntity){
    return ShopModel(
        image: shopEntity.shopImage,
        phoneNumber: shopEntity.shopPhoneNumber,
        address: shopEntity.shopAddress,
        name: shopEntity.shopName,

    );
  }


  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    phoneNumber: json['shopPhoneNumber'],
    address: json['shopAddress'],
    name: json['shopName'],
    image: json['shopImage'],
    rate: json['shopRate'],
    Id: json['shopId'],
  );

  Map<String, dynamic> toJson() {
    return {
      'shopName': shopName,
      'shopId': shopId,
      'shopAddress': shopAddress,
      'shopPhoneNumber': shopPhoneNumber,
      'shopImage': shopImage,
      'shopRate': shopRate,
    };
  }
}