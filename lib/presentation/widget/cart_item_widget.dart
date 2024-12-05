


import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cart,
    required this.width,
  });

  final ProductModel cart;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      //color: Colors.green,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
    
                width: 320,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cart.productName,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        fontSize: width<400 ? 14: 17,
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                            "x",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: width<400 ? 14: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "₹ ${cart.productprice}",
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        fontSize: width<400 ? 12: 17,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            // width: 250,
    
            child: SizedBox(
              //color: Colors.green,
              // width: 125,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ ${cart.productprice}",
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: width<400 ? 12: 14,
                        ),
                      ),
                      const Text("|"),
                      Text(
                        'IGST18',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: width<400 ? 12: 14,
                        ),
                      ),
                      const Text("|"),
                      Text(
                        'SKU: ABCHW1787992',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: width<400 ? 12: 14,
                        ),
                      ),
                    ],
                  ),
                  cart.discount != "0"
                      ? Text(
                          cart.discount!,
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

