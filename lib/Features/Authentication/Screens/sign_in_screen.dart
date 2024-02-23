import 'package:flutter/material.dart';
import 'package:zoom_clone/Features/Authentication/Repository/auth_repository_implementation.dart';
import 'package:zoom_clone/Features/Authentication/Widgets/custom_buttons.dart';
import 'package:zoom_clone/Features/Meetings/Screens/meeting_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthRepositoryImplementation _authRepositoryImplementation =
      AuthRepositoryImplementation();

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
              await _authRepositoryImplementation.signIn(
                  emailEditingController.text, passwordEditingController.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeetingScreen(),
                  ));
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
            onTap: () async {
              await _authRepositoryImplementation.googleSignIn();
            },
            assetIconURL: 'Assets/Images/googleIcon.png',
          ),
        ],
      ),
    );
  }
}
