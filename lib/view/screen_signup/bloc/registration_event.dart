part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class RegisterEvent extends RegistrationEvent {
  RegisterEvent({
    required this.name,
    required this.mail,
    required this.passwrd,
  });
  String name;
  String mail;
  String passwrd;
  
}
