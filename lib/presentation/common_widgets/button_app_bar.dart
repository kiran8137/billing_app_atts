
import 'package:billing_app_atts/presentation/screens/home_screen/widgets_components/add_product_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAppBar extends StatelessWidget {
  const ButtonAppBar({
    super.key, required this.title, this.onTap,
  });
 
 final String title;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 35,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            title,
             style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w500
             ),
          
          ),
        ),
      ),
    );
  }
}



