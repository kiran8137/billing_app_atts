import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:billing_app_atts/data/respository/product_repo_implement.dart';
import 'package:billing_app_atts/domain/respositoy/products.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepoImplement productsRepository;

  ProductBloc({required this.productsRepository}) : super(ProductInitial()) {
    
     on<AddProductEvent>(addProductEvent);
     on<GetProductsEvent>(getProductsEvent);
  }

   

  FutureOr<void> addProductEvent(AddProductEvent event, Emitter<ProductState> emit) async{
    try{

      final response = await productsRepository.addProduct(productName: event.productName, productPrice: event.productPrice);
      if(response == true){
        emit(AddProductSuccessState());
      }else{
        emit(AddProductErrorState());
      }
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getProductsEvent(GetProductsEvent event, Emitter<ProductState> emit) async{
    try{
      final response = await productsRepository.getProducts();
      if(response.isNotEmpty){
        emit(GetProductsSuccessState(products: response));
      }else{
        emit(GetProductsEmptyState());
      }
    }catch(error){
      log(error.toString());
    }
  }
}
