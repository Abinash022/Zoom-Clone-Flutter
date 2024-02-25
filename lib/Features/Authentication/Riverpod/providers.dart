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

final authStateProvider = StreamProvider((ref) {
  final authState = ref.watch(authNotifierProvider.notifier);

  return authState.authStateChange;
});
