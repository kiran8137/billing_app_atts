part of 'bill_bloc.dart';

sealed class BillEvent extends Equatable {
  const BillEvent();

  @override
  List<Object> get props => [];
}


class CreateBillEvent extends BillEvent{
  final BillModel bill;

 const CreateBillEvent({required this.bill});

 @override
  // TODO: implement props
  List<Object> get props => [bill];
}

class GetBillDetailEvent extends BillEvent{
  final String billId;

  const GetBillDetailEvent({required this.billId});

  @override
  // TODO: implement props
  List<Object> get props => [billId];
  
}
