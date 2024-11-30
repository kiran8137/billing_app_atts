
import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWithName extends StatelessWidget {
   const  TextFieldWithName({
    super.key, required this.title, required this.textController,
  });
  final TextEditingController textController;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: GoogleFonts.notoSans(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w500
          ),
          ),
          CommonTextField(controller: textController,),
        ],
      ),
      );
  }
}