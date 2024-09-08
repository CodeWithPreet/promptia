import 'package:promptia/core/core.dart';
import 'package:promptia/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  @override
  AsyncValue<User> build() {
    logger.i('AuthViewModel initialized');
    getLoadUser();
    // loadCurrentUser();
    return const AsyncLoading();
  }

  Future<AsyncValue<User>> loadCurrentUser() async {
    logger.i('Loading current user');
    User? user = ref.read(getCurrentUserProvider).call();

    if (user == null) {
      state = const AsyncError(ClientError("User not found"), StackTrace.empty);
    } else {
      state = AsyncData(user);
    }

    return state;
  }

  Future<AsyncValue<User>> getLoadUser() async {
    logger.i('get loading user');
    final user = await ref.read(loadUserProvider).call();
    state = user;

    logger.d(user);
    state = user;
    return state;
  }

  Future<AsyncValue<void>> signOut() async {
    logger.d('signOut');
    final result = await ref.read(signoutUsecaseProvider).call();
    // ref.invalidateSelf();
    return result;
  }

//login
  Future<AsyncValue<User>> loginWithEmail(String email, String password) async {
    logger.i('Attempting to login in with email: $email');
    return state = await ref
        .read(loginUsecaseProvider)
        .call(LoginUsecaseParams(email: email, password: password));
  }

  //signUp
  Future<AsyncValue<User>> signupWithPassword(
      String name, String email, String password) async {
    logger.i('Attempting to sign up with email: $email');
    final result = await ref
        .read(signupUsecaseProvider)
        .call(SignupParams(name: name, email: email, password: password));
    state = result;
    return result;
    // state=AsyncValue.data();
    // state= AsyncValue.error(error, stackTrace);
  }
}
