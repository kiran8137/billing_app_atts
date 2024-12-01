
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Bills',
    style: GoogleFonts.ptSans(
      fontWeight: FontWeight.bold
    )
    );
  }
}