

import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/domain/entities/bill_entity.dart';

abstract class BillRepository{

  Future<String> createBill(BillEntity bill);

  Future<BillModel> getBillDetails({required String billId});
}