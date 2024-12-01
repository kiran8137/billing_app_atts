
import 'package:billing_app_atts/data/model/product_model.dart';

abstract class ProductsRepository{

   Future<bool> addProduct({required String productName, required String productPrice , String? discount});

   Future<List<ProductModel>> getProducts();
}