import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/test_repo.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required repo})
      : _repo = repo,
        super(SignInInitial()) {
    on<CredentialsChanged>(_credentialsChanged);
    on<SignInInitiated>(_signinInitiated);
    _repoSubscription = _repo.status.listen((status) {
      debugPrint("in subscription");
      add(SignInInitiated(status));
    });
  }

  final TestRepo _repo;
  late StreamSubscription<Status> _repoSubscription;

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

  _signinInitiated(event, emit) {
    switch (event.status) {
      case Status.loading:
        emit(SignInLoading());
        debugPrint("in loading");
        _repo.pageLoaded();
        break;
      case Status.loaded:
        debugPrint("in loaded");
        emit(SignInLoaded());
        break;
    }
  }

  @override
  Future<void> close() {
    _repoSubscription.cancel();
    _repo.dispose();
    return super.close();
  }
}
