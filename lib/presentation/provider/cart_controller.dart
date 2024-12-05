

 

 

import 'package:billing_app_atts/configs/helper_models.dart';
import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier{

  int total = 0;
  Set<ProductModel> selectedProduct = {};
  AddressModel? selectedAddress;
  double remainingAmount = 0.0;

  
   
   void addTotal(int  amount , int discount){

    if(discount != 0){
      var price = amount - (amount*discount~/100);
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

   void removeSelectProduct(String  productId){

    for(var i in selectedProduct){
     if(i.productId.toString() == productId){
      selectedProduct.remove(i);
      break;
     }
    }
   }

   void addSelectedAddress(AddressModel address){
    selectedAddress = address;
    debugPrint("selected address : $selectedAddress");
    notifyListeners();
   }


    void calculateStillRemainingAmt(String totalAmount , String paidAmount){
      var ans = double.parse(totalAmount) - double.parse(paidAmount);
      remainingAmount = ans;
      notifyListeners();


   
   

    }

      

    

   

    


}