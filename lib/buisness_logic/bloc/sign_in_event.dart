part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class CredentialsChanged extends SignInEvent {
  String email;
  String password;
  CredentialsChanged(this.email, this.password);
}

class SignInInitiated extends SignInEvent {}
