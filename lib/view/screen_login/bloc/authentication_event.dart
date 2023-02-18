part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  LoginEvent({
    required this.mail,
    required this.password,
  });
  String mail;
  String password;
}
