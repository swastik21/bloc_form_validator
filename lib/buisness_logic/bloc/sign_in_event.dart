part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class CredentialsChanged extends SignInEvent {
  String email;
  String password;
  bool emailChanged;
  bool passwordChanged;
  CredentialsChanged(
      this.email, this.password, this.emailChanged, this.passwordChanged);
}

class SignInInitiated extends SignInEvent {}
