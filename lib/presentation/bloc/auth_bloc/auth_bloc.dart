import 'dart:async';
import 'dart:developer';
 

import 'package:billing_app_atts/data/respository/auth_repo_implement.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepoImplement authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
     
     on<SignInEvent>(signInEvent);
     on<LogInEvent>(logInEvent);
     on<SignOutEvent>(signOutEvent);
     
  }

  FutureOr<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async{
    try{
      emit(AuthInitial());
     final response = await authRepository.sigInUser(userName:event.userName,  email: event.email, password: event.password);

     if(response.user != null){
      emit(AuthSuccessState());
     }
    }catch(error){
       
      emit(AuthErrorState());
    }
  }

   FutureOr<void> logInEvent(LogInEvent event, Emitter<AuthState> emit) async{
    try{
    final response = await authRepository.logInUser(email: event.email, password: event.password);
    if(response.user != null){
      emit(AuthSuccessState());
    }

    }catch(error){
      emit(AuthErrorState());
    }
  }

  FutureOr<void> signOutEvent(SignOutEvent event, Emitter<AuthState> emit) async{
    try{
      final response = await authRepository.signOutUser();
      if(response == true){
        emit(SignOutSuccessState());
      }else{
        emit(SignOutErrorsState());
      }
    }catch(error){
      emit(SignOutErrorsState());
      log(error.toString());

    }
  }

 
}
