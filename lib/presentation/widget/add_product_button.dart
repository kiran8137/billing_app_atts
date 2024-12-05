
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(top: height < 800 ? 70: 100),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        "Add Product",
        style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold, fontSize: 16),
      )),
    );
  }
}
