import 'package:bloc_form_validator/buisness_logic/bloc/sign_in_bloc.dart';
import 'package:bloc_form_validator/presentation/screens/signin_screen.dart';
import 'package:bloc_form_validator/repo/test_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            "Welcome",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 400,
          ),
          CupertinoButton(
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SignInBloc(repo: TestRepo()),
                    child: SignInScreen(),
                  ),
                ),
              );
            },
            child: const Text("Sign in with Email"),
          ),
          const SizedBox(
            height: 24,
          )
        ]),
      ),
    );
  }
}
