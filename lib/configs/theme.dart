
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Color.fromARGB(255, 45, 158, 49),
    secondary: Color.fromARGB(255, 235, 235, 235),
     onSecondary: Color.fromARGB(255, 88, 88, 88),
    tertiary:  Color.fromARGB(255, 249, 249, 249),
  )
);




//Dark theme 
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 0, 0, 0),
    primary: Color.fromARGB(255, 45, 158, 49),
    secondary: Color.fromARGB(255, 44, 44, 44),
    onSecondary: Color.fromARGB(255, 189, 188, 188),
    tertiary: Color.fromARGB(255, 26, 26, 26),

  )
);