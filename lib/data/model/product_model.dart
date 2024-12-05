import 'package:billing_app_atts/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
    
      {
        required super.productId,
        required super.productName,
      required super.productprice,
        super.discount 
      
    //  required super.productImage
      });

  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        productId: json['productId'],
        productName: json['productName'],
        productprice:  json['productPrice'],
        discount: json['discount'] ?? "0"
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId' : productId,
      'productName': productName,
      'productPrice': productprice,
      'discount' : discount,
       
    };
  }
}
