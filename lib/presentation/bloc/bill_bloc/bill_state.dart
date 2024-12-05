part of 'bill_bloc.dart';

sealed class BillState extends Equatable {
  const BillState();
  
  @override
  List<Object> get props => [];
}

final class BillInitial extends BillState {}


final class CreateBillSuccessState extends BillState{
  final String billId;

  const CreateBillSuccessState({required this.billId});

  @override
  // TODO: implement props
  List<Object> get props => [billId];
}

final class CreateBillErrorState extends BillState{}

final class GetBillDetailsSuccess extends BillState{

  final  BillModel bill;

  const GetBillDetailsSuccess({required this.bill});

}

final class GetBillErrorState extends BillState{}