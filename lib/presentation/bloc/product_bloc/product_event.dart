part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class AddProductEvent extends ProductEvent{
  final String productName;
  final String productPrice;

  const AddProductEvent({required this.productName, required this.productPrice});

  @override
  // TODO: implement props
  List<Object> get props => [productName,productPrice];
  
}


class GetProductsEvent extends ProductEvent{}

 