import 'package:bloc_form_validator/buisness_logic/bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state is CredentialsInValid && state.errorName == "emailError"
                    ? Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.redAccent),
                      )
                    : const SizedBox.shrink(),
                TextField(
                  controller: _emailController,
                  onChanged: (val) {
                    context.read<SignInBloc>().add(
                          CredentialsChanged(_emailController.text,
                              _passwordController.text, true, false),
                        );
                  },
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                state is CredentialsInValid &&
                        state.errorName == "passwordError"
                    ? Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.redAccent),
                      )
                    : const SizedBox.shrink(),
                TextField(
                  controller: _passwordController,
                  onChanged: (val) {
                    context.read<SignInBloc>().add(
                          CredentialsChanged(_emailController.text,
                              _passwordController.text, false, true),
                        );
                  },
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CupertinoButton(
                    color: state is CredentialsValidated
                        ? Colors.blueAccent
                        : Colors.grey,
                    onPressed: () {
                      context.read<SignInBloc>().add(SignInInitiated());
                    },
                    child: state is SignInLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text("Sign in "),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
