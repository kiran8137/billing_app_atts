
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   const  Button({
    super.key, required this.buttonTitle,required this.onTap
  });
final String buttonTitle;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       //padding: EdgeInsets.all(10),
       margin: EdgeInsets.symmetric(horizontal: 20),
       height: 50,
       width: double.infinity,
       decoration: BoxDecoration(
         color: Theme.of(context).colorScheme.secondary,
         borderRadius: BorderRadius.circular(5)
       ),
       child: Center(
         child: Text(buttonTitle),
       ),
      
       
      ),
    );
  }
}