part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState{}

final class AuthErrorState extends AuthState{}

final class UnAuthenticated extends AuthState{}

final class SignOutSuccessState extends AuthState{}

final class SignOutErrorsState extends AuthState{}
