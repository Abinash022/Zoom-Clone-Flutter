import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zoom_clone/Features/Authentication/Riverpod/providers.dart';
import 'package:zoom_clone/Features/Authentication/Screens/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoom_clone/Features/Meetings/Screens/main_bottom_navigation.dart.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final isLogedIn = ref.watch(isLoggedInProvider);
          if (isLogedIn) {
            return const ButtomNavigationTabs();
          }
          return const AuthenticationScreen();
        },
      ),
    );
  }
}
