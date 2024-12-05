
import 'dart:developer';

import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:billing_app_atts/domain/respositoy/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductRepoImplement extends ProductsRepository{
  @override
  Future<bool> addProduct({required String productName, required String productPrice , String? discount})async {
    bool isAddComplete = false;
    try{
      final collectionRef =   FirebaseFirestore.instance.collection("products").doc();


        
      ProductModel product = ProductModel(
        productId: collectionRef.id,
        productName: productName, 
        productprice: double.parse(productPrice).toString(), 
        discount: discount ?? "0"
        );

        await collectionRef.set(product.toJson());
        return isAddComplete;

    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }
  
  @override
  Future<List<ProductModel>> getProducts() async{
     
     try{
      final snapShot = await FirebaseFirestore.instance.collection("products").get();
      List<ProductModel> productList = snapShot.docs.map((product)=> ProductModel.fromJson(json: product.data())).toList();
      debugPrint(productList.toString());
      return productList;
     }catch(error){
      log(error.toString());
      throw Exception();
     }
  }

  
}