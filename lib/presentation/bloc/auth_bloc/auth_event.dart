part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


class SignInEvent extends AuthEvent{

  final String userName;
  final String email;
  final String password;
  

  const SignInEvent({required this.email, required this.password , required this.userName});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}

class LogInEvent extends AuthEvent{

  final String email;
  final String password;

  const LogInEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}


class SignOutEvent extends AuthEvent{}
