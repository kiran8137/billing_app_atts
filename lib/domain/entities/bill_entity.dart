import 'package:billing_app_atts/configs/helper_models.dart';
import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BillEntity extends Equatable{

  final String? billNo;
  final String? ordreNo;
  final List<String>? productIds;
  final String? name;
  final String? mobileNumber;
  final String? location;
  final String? paymentMode;
  final String? totalAmount;

  const BillEntity({  this.billNo,  this.ordreNo,   this.productIds,   this.name, this.mobileNumber, this.location,  this.paymentMode,   this.totalAmount});
  
  @override
  // TODO: implement props
  List<Object?> get props => [billNo, ordreNo, productIds, name,mobileNumber,location,  paymentMode,totalAmount];
}