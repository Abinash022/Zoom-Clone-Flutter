import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zoom_clone/Features/Authentication/Repository/auth_repository_implementation.dart';
import 'package:zoom_clone/Features/Authentication/Riverpod/providers.dart';

import '../Widgets/custom_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final signUpState = ref.watch(authNotifierProvider.notifier);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text('Sign Up'),
          ),
          body: Column(
            children: [
              const Text(
                'ENTER YOUR EMAIL ADDRESS',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: emailEditingController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordEditingController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 27.0,
              ),
              ButtonWidget(
                text: 'Sign Up',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () {
                  signUpState.signUp(
                    emailEditingController.text,
                    passwordEditingController.text,
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'By Proceeding, I agree to the Zoom Privacy Statement and Terms of Service.',
                style: TextStyle(
                  color: Color.fromRGBO(45, 101, 246, 1),
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              const Text(
                'OR SELECT YOUR SIGNUP METHOD',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 28.0,
              ),
              ButtonWidget(
                text: 'Continue With Google',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () {
                  signUpState.googleSignIn();
                },
                assetIconURL: 'Assets/Images/googleIcon.png',
              ),
            ],
          ),
        );
      },
    );
  }
}
