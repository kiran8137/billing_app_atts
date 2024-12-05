
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentModeWidget extends StatelessWidget {
  const PaymentModeWidget({
    super.key, required this.title, this.onTap,
  });
 final String title;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        //width: 80,
         decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.secondary,
           borderRadius: BorderRadius.circular(5)
         ),
         child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(title,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
      ),
    );
  }
}
