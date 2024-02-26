import 'package:firebase_auth/firebase_auth.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zoom_clone/Features/Authentication/Repository/auth_repository_implementation.dart';

class AuthNotifier extends StateNotifier<bool> {
  final AuthRepositoryImplementation _authRepositoryImplementation;

  AuthNotifier(
    this._authRepositoryImplementation,
  ) : super(false);

  Stream<User?> get authStateChange => _authRepositoryImplementation.userState;

  Future<void> googleSignIn() async {
    state = false;
    await _authRepositoryImplementation.googleSignIn();
    state = true;
  }

  Future<void> logOut() async {
    state = false;
    await _authRepositoryImplementation.logOut();
    state = true;
  }

  Future<void> signIn(String email, String password) async {
    state = false;
    await _authRepositoryImplementation.signIn(email, password);
    state = true;
  }

  Future<void> signUp(String email, String password) async {
    state = false;
    await _authRepositoryImplementation.signUp(email, password);
    state = true;
  }
}
