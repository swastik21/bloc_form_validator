part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class CredentialsValidated extends SignInState {}

class CredentialsInValid extends SignInState {
  String errorMessage;
  String errorName;
  CredentialsInValid(this.errorMessage, this.errorName);
}

class CredentialsEmpty extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {}
