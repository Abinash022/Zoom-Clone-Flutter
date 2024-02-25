import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zoom_clone/Features/Authentication/Riverpod/providers.dart';
import 'package:zoom_clone/Features/Authentication/Widgets/custom_buttons.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log Out',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Consumer(
          builder: (context, ref, child) {
            return ButtonWidget(
              text: 'Log Out',
              color: const Color.fromRGBO(45, 101, 246, 1),
              onTap: () async {
                final logOutUser = ref.watch(authNotifierProvider.notifier);
                return logOutUser.logOut();
              },
            );
          },
        ),
      ),
    );
  }
}
