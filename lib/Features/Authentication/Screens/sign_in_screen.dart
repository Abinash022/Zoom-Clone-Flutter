import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:zoom_clone/Features/Authentication/Riverpod/providers.dart';
import 'package:zoom_clone/Features/Authentication/Widgets/custom_buttons.dart';
import 'package:zoom_clone/Features/Meetings/Screens/main_bottom_navigation.dart.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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
    final signInState = ref.watch(authNotifierProvider.notifier);

    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text('Sign in'),
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
                text: 'Sign In',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () async {
                  await signInState.signIn(emailEditingController.text,
                      passwordEditingController.text);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 101, 246, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              const Text(
                'OTHER SIGN IN METHODS',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 28.0,
              ),
              ButtonWidget(
                text: 'Continue With Google',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () {
                  signInState.googleSignIn();
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
