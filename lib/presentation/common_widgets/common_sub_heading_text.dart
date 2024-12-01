

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonSubHeadingText extends StatelessWidget {
  const CommonSubHeadingText({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: GoogleFonts.notoSans(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSecondary
    ),
    );
  }
}