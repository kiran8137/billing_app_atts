

import 'dart:convert';

import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:billing_app_atts/domain/entities/bill_entity.dart';

class BillModel extends BillEntity{
 const BillModel({  super.billNo,   super.ordreNo,   super.productIds, super.name, super.mobileNumber,super.location,   super.paymentMode,   super.totalAmount});


 factory BillModel.fromJson({required Map<String , dynamic> json}){
  return BillModel(
    billNo: json["billNo"], 
    ordreNo: json["orderNo"], 
    productIds:  json["productIds"], 
    name: json["name"],
    mobileNumber: json["mobileNumber"], 
    location: json["location"],
    paymentMode: json["paymentMode"], 
    totalAmount: json["totalAmount"]
    );
 }


Map<String, dynamic> toJson() {
    return {
       'billNo' : billNo,
        "orderNo":ordreNo,
        "items":  productIds,
         "name" :name,
         "mobileNumber" : mobileNumber,
         "location" : location,
        "paymentMode":paymentMode,
        "totalAmount" : totalAmount
       
    };
  }



  
}