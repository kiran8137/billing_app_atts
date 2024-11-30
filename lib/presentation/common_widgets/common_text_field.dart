
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key, this.prefixIcon, this.suffixIcon, this.onTap, required this.controller,
  });

final IconData? prefixIcon;
final IconData? suffixIcon;
final void Function()? onTap;
final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(prefixIcon,color: Theme.of(context).colorScheme.primary)),
          prefixIcon: Icon(suffixIcon, color: Colors.grey,)
          
        )
      ),
    );
  }
}