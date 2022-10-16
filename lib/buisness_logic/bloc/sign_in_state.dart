part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInValid extends SignInState {}

class CredentialsValidated extends SignInState {}

class CredentialsInValid extends SignInState {
  String errorMessage;
  CredentialsInValid(this.errorMessage);
}

class SignInLoading extends SignInState {}
