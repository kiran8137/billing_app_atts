import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:billing_app_atts/presentation/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomAppbar extends StatelessWidget {
  const BottomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, child) => 
      BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ ${value.total}',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            value.selectedProduct.isNotEmpty?
            ButtonAppBar(
              title: 'Cart',
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => CartScreen()));
              },
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}

