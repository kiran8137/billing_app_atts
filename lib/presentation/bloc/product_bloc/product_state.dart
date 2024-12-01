part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

 
final class AddProductSuccessState extends ProductState{}

final class AddProductErrorState extends ProductState{}

final class GetProductsSuccessState extends ProductState{
final  List<ProductModel> products;

 const GetProductsSuccessState({required this.products});

 @override
  // TODO: implement props
  List<Object> get props => [products];

}

final class GetProductsEmptyState extends ProductState{
  
}
