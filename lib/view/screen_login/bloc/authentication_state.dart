part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class LoginSuccess extends AuthenticationState{}

class loginFailed extends AuthenticationState{
  loginFailed({required this.message});
  String message;
}