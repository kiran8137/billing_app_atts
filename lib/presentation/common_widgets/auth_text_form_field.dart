


import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({super.key, required this.obscureText, required this.hintText, required this.textController,required this.validator});

final bool obscureText;
final String hintText;
final TextEditingController textController;
final  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        controller: textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
           hintText: hintText,
           hintStyle:   TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
           ),
           fillColor: Theme.of(context).colorScheme.secondary,
           filled: true
         
        )
      ),
    );
  }
}