

import 'dart:developer';

import 'package:billing_app_atts/domain/respositoy/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplement extends AuthRepository{


@override
  Future<UserCredential> sigInUser({required String userName, required String email, required String password})async{
    
    final FirebaseAuth authInstance = FirebaseAuth.instance;
    try{
      return  await authInstance.createUserWithEmailAndPassword(email: email, password: password);
    }catch(error){
      
      log(error.toString());
      throw Exception();

    }
  }

  @override
  Future<UserCredential> logInUser({required String email, required String password})async{
   final FirebaseAuth authInstance = FirebaseAuth.instance;
    try{
       return await authInstance.signInWithEmailAndPassword(email: email, password: password);
    }catch(error){
      log(error.toString());
      throw Exception();

    }
  }

  

  @override
  Future<bool> signOutUser()async{
   final FirebaseAuth authInstance = FirebaseAuth.instance;
    try{
      await authInstance.signOut();
      return true;
    }catch(error){
      
      log(error.toString());
      return false;
      
      

    }
  }

}
