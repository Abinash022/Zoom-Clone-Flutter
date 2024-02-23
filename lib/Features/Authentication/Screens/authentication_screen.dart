import 'package:flutter/material.dart';
import 'package:zoom_clone/Features/Authentication/Screens/sign_in_screen.dart';
import 'package:zoom_clone/Features/Authentication/Screens/sign_up_screen.dart';
import 'package:zoom_clone/Features/Authentication/Widgets/custom_buttons.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 101, 246, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(45, 101, 246, 1),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Center(
            child: Text(
              'ZOOM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Get Started with your account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    ButtonWidget(
                      text: 'Join a Meeting',
                      color: const Color.fromRGBO(45, 101, 246, 1),
                      onTap: () {},
                    ),
                    ButtonWidget(
                      text: 'Sign Up',
                      color: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                    ),
                    ButtonWidget(
                      text: 'Sign In',
                      color: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
