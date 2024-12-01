

 

import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends ChangeNotifier{

  double total = 0.0;
  Set<ProductModel> selectedProduct = {};

  

   void addTotal(int  amount , int discount){

    if(discount != 0){
      var price = amount - (amount*discount/100);
      total+=price;
        
    }else{
      total+=amount;
    }

    notifyListeners();
   }

   void deduct(int amount){
    total-=amount;
    notifyListeners();
   }

   void addSelectProduct(ProductModel product){
    selectedProduct.add(product);
    notifyListeners();
   }

   

    


}