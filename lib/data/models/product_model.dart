import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';

class ProductModel extends HomeShopProductEntity {
  String? name, id, image, description;
  num? price;

  ProductModel({this.name, this.id, this.price, this.image, this.description})
    : super(
        productId: id ?? '',
        productImage:
            image ??
            "https://firebasestorage.googleapis.com/v0/b/yalla-delivery-app-f5ce2.firebasestorage.app/o/bannerFourImage.jpeg?alt=media&token=1adf43c1-0958-46ed-b80a-988202f1c543",
        productName: name ?? 'لا توجد بيانات',
        productPrice: price ?? 0.0,
        productDescription: description ?? 'لا توجد بيانات',
      );

  factory ProductModel.fromEntity(HomeShopProductEntity product) {
    return ProductModel(
      name: product.productName,
      image: product.productImage,
      description: product.productDescription,
      id: product.productId,
      price: product.productPrice,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['productName'],
      image: json['productImage'],
      description: json['productDescription'],
      id: json['productId'],
      price: json['productPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'productName': name,
      'productDescription': description,
      "productPrice": price,
    };

    // ضيف الصورة بس لو فيها قيمة
    if (image != null && image!.isNotEmpty) {
      data["productImage"] = image;
    }

    // ضيف الصورة بس لو فيها قيمة
    if (id != null && id!.isNotEmpty) {
      data["productId"] = id;
    }

    return data;
  }
}
