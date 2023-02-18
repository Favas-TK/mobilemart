part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class SignUpSuccess extends RegistrationState{}

class SignUpFailed extends RegistrationState{
  SignUpFailed({required this.message});
  String message;
}
