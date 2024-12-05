
import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListTile(
     
      
        leading: const CircleAvatar(),
        title: Text(
          product.productName,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: width < 400 ? 16 :  19,
          ),
        ),
        subtitle: Text(
          "₹ ${product.productprice}",
          style: GoogleFonts.notoSans(),
        ),
        minTileHeight: width<400 ? 60 : 70,
        tileColor: Theme.of(context).colorScheme.tertiary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)));
  }
}
