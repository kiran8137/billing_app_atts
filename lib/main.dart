import 'package:billing_app_atts/configs/bloc_providers.dart';
import 'package:billing_app_atts/data/respository/auth_repo_implement.dart';
import 'package:billing_app_atts/data/respository/product_repo_implement.dart';
import 'package:billing_app_atts/firebase_options.dart';
import 'package:billing_app_atts/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:billing_app_atts/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:billing_app_atts/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:billing_app_atts/presentation/screens/cart_screen/cart_screen.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/home_screen.dart';
import 'package:billing_app_atts/configs/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
    create: (contex)=> AuthBloc(authRepository: AuthRepoImplement())
    ),
    BlocProvider(
    create: (contex)=> ProductBloc(productsRepository: ProductRepoImplement())..add(GetProductsEvent())
    ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CartController(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'billing app',
           theme: lightTheme,
           darkTheme: darkTheme,
          home:SignInScreen(),
        ),
      ),
    );
  }
}

