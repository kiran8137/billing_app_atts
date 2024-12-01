
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{

  final String productId;
  final String productName;
  final String productprice;
  final String? discount;
  //final String productImage;

  const ProductEntity({required this.productId, required this.productName, required this.productprice , this.discount});
  
  @override
  // TODO: implement props
  List<Object?> get props => [productId , productName, productprice, discount];

  
}