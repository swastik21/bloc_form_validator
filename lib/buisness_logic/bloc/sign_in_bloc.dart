import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInValid()) {
    on<CredentialsChanged>(_credentialsChanged);
    on<SignInInitiated>(_signinInitiated);
  }

  _credentialsChanged(CredentialsChanged event, emit) {
    if (EmailValidator.validate(event.email) == false) {
      emit(CredentialsInValid("Please enter valid email"));
    } else if (event.password.length < 6) {
      emit(CredentialsInValid("Please enter valid password"));
    } else {
      emit(CredentialsValidated());
    }
  }

  _signinInitiated(SignInInitiated event, emit) {
    emit(SignInLoading());
  }
}
