import 'dart:async';
import 'dart:developer';

import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/data/respository/bill_repo_implement.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  final BillRepoImplement billRepository;
  BillBloc({required this.billRepository}) : super(BillInitial()) {
    
    on<CreateBillEvent>(createBill);
    on<GetBillDetailEvent>(getBillDetails);
  }

  FutureOr<void> createBill(CreateBillEvent event, Emitter<BillState> emit) async {
    
    try{
     final result = await billRepository.createBill(event.bill);
     emit(CreateBillSuccessState(billId: result));
    }catch(error){

        log("create bill ${error.toString()}");
    }

  }

  FutureOr<void> getBillDetails(GetBillDetailEvent event, Emitter<BillState> emit)async {
    try{

      final bill = await billRepository.getBillDetails(billId: event.billId);
      debugPrint(bill.toString());
       
      emit(GetBillDetailsSuccess(bill: bill));
      
    }catch(error){
      emit(GetBillErrorState());
      log(error.toString());
    }
  }
}
