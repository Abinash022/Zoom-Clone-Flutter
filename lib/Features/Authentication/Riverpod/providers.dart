import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zoom_clone/Features/Authentication/Repository/auth_repository_implementation.dart';
import 'package:zoom_clone/Features/Authentication/Riverpod/auth_notifier.dart';

final authRepositoryprovider = Provider(
  (ref) {
    return AuthRepositoryImplementation();
  },
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
  (ref) {
    return AuthNotifier(
      ref.watch(authRepositoryprovider),
    );
  },
);

final authStateChangeProvider = FutureProvider<User?>((ref) async {
  final authRepo = ref.watch(authRepositoryprovider);
  return authRepo.getCurrentUser();
});

final isLoggedInProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateChangeProvider).asData?.value;
  return user != null;
});
