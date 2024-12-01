import 'package:billing_app_atts/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/auth_text_form_field.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_button.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/home_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is AuthSuccessState){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
             
                      emailController.clear();
                      passwordController.clear();
          }
          if(state is AuthErrorState){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some thing went wrong")));
          }
          
        },
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //email field
                  AuthTextFormField(
                    obscureText: false,
                    hintText: 'Email',
                    textController: emailController,
                    validator: (value) {
                      final regExp = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!regExp.hasMatch(value!) || value.isEmpty) {
                        return 'Enter a valid Email';
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 10),

                  //password field
                  AuthTextFormField(
                    obscureText: true,
                    hintText: 'Password',
                    textController: passwordController,
                    validator: (value) {
                      final regExp = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$',
                      );
                      if (!regExp.hasMatch(value!) ||
                          value.isEmpty ||
                          value.length < 3) {
                        return "Password must be at least 8 characters long, include "
                            "an uppercase letter, a lowercase letter, a number, and a special character";
                      }
                    },
                  ),

                  SizedBox(height: 30),

                  //login button
                  Button(
                    buttonTitle: 'LogIn',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint('validated');
                        BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
                    },
                  ),

                  SizedBox(height: 10),

                  //not a user, register text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a user?',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const SignInScreen()));
                          },
                          child: Text('Register'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
