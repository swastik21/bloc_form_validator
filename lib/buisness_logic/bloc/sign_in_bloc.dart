import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<CredentialsChanged>(_credentialsChanged);
    on<SignInInitiated>(_signinInitiated);
  }

  _credentialsChanged(CredentialsChanged event, emit) {
    if (EmailValidator.validate(event.email) == false && event.emailChanged) {
      emit(CredentialsInValid("Please enter valid email", "emailError"));
    } else if (event.password.length < 6 && event.passwordChanged) {
      emit(CredentialsInValid(
          "Please enter password of minimum length 6", "passwordError"));
    } else if (event.email.isEmpty || event.password.isEmpty) {
      emit(CredentialsEmpty());
    } else {
      emit(CredentialsValidated());
    }
  }

  _signinInitiated(SignInInitiated event, emit) {
    emit(SignInLoading());
  }
}
