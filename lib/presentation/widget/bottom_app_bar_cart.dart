

import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarCart extends StatelessWidget {
  const BottomBarCart({
    super.key,
    required this.width,
    required this.cartProvider,
  });

  final double width;
  final CartController cartProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      // color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //color: Colors.green,
            width: width<400 ? 150 : 200,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: width<400 ? 20 : 23,
                  ),
                ),
                Text(
                  '(item:${cartProvider.selectedProduct.length})',
                  )
              ],
            ),
          ),
          Text(
            "₹ ${cartProvider.total}",
            style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: width<400 ? 20 : 23,
                  ),
          ),
        ],
      ),
    );
  }
}
