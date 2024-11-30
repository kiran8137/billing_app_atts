import 'package:billing_app_atts/presentation/screens/home_screen/home_screen.dart';
import 'package:billing_app_atts/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'billing app',
       theme: lightTheme,
       darkTheme: darkTheme,
      home:   HomeScreen(),
    );
  }
}

