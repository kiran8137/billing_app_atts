
 

import 'dart:math';

import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/domain/entities/bill_entity.dart';
import 'package:billing_app_atts/domain/respositoy/bill_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BillRepoImplement extends BillRepository{


  @override
  Future<String> createBill(BillEntity bill) async{
     
     try{
      
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

        final collectRef =    firebaseFirestore.collection("bills").doc();

        BillModel currentBill = BillModel(
          billNo: collectRef.id, 
          ordreNo: Random().nextInt(1000).toString(), 
          productIds: bill.productIds, 
          location: bill.location,
          name: bill.name,
          mobileNumber: bill.mobileNumber,
          paymentMode: bill.paymentMode, 
          totalAmount: bill.totalAmount
          );

       await collectRef.set(currentBill.toJson());
       
return collectRef.id;
         

     }catch(error){
       debugPrint(error.toString());
        throw Exception();
     }
  }

  @override
  Future<BillModel> getBillDetails({required String billId}) async{
    
    try{
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

       final snapShot =  await firebaseFirestore.collection("bills").doc(billId).get();

       final currentBill = BillModel.fromJson(json: snapShot.data()!);

       return currentBill;

    }catch(error){
      
      throw Exception();
    }
  }
  
}