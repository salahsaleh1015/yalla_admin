


import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';

class BannerModel extends HomeBannerEntity {
  String? bannerId;
  String? image;
  String? name;
  String? address;
  String? phoneNumber;

  BannerModel(
      {this.bannerId,
        this.image,
        this.name,
        this.address,
        this.phoneNumber})
      : super(
    bannerImage: image ??
        "https://firebasestorage.googleapis.com/v0/b/yalla-delivery-app-f5ce2.firebasestorage.app/o/bannerFourImage.jpeg?alt=media&token=1adf43c1-0958-46ed-b80a-988202f1c543",
    bannerShopName: name ?? 'لا توجد بيانات',
    bannerShopAddress: address ?? 'لا توجد بيانات',
    bannerShopPhoneNumber: phoneNumber ?? 'لا توجد بيانات',
  );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      bannerId: json['bannerId'],
      image: json['bannerImage'],
      name: json['bannerShopName'],
      address: json['bannerShopAddress'],
      phoneNumber: json['bannerShopPhoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'bannerId': bannerId,
    'bannerImage': image,
    'bannerShopName': name,
    'bannerShopAddress': address,
    'bannerShopPhoneNumber': phoneNumber,
  };
}