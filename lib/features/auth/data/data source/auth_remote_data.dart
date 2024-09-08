import 'package:promptia/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteData {
  Future<AsyncValue<User>> login({
    required String email,
    required String password,
  });
  Future<AsyncValue<User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<AsyncValue<User>> loadUser();

  User? getCurrentUser();
  Future<AsyncValue<void>> signOut();
}

class AuthRemoteDataImpl implements AuthRemoteData {
  final SupabaseClient supabaseClient;

  const AuthRemoteDataImpl({required this.supabaseClient});

  @override
  User? getCurrentUser() {
    return supabaseClient.auth.currentUser;
  }

  @override
  Future<AsyncValue<User>> login({
    required String email,
    required String password,
  }) async {
    logger.i('Attempting to login with email: $email');
    try {
      // Indicate loading state
      final result = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      logger.i('Login successful');
      return AsyncValue.data(result
          .user!); // Use `null` if you don't need to return any specific data
    } catch (e, stackTrace) {
      logger.e('Login failed with exception: $e',
          error: e, stackTrace: stackTrace);
      return AsyncValue.error(e, stackTrace);
    }
  }

  @override
  Future<AsyncValue<User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    logger.i('Attempting to sign up with email: $email');
    try {
      final result = await supabaseClient.auth.signUp(
        data: {
          "name": name,
        },
        email: email,
        password: password,
      );
      logger.i('Sign-up successful');
      return AsyncValue.data(result
          .user!); // Use `null` if you don't need to return any specific data
    } catch (e, stackTrace) {
      logger.e('Sign-up failed with exception: $e',
          error: e, stackTrace: stackTrace);
      return AsyncValue.error(e, stackTrace);
    }
  }

  @override
  Future<AsyncValue<User>> loadUser() async {
    try {
      final userResponse = await supabaseClient.auth.getUser();

      if (userResponse.user != null) {
        return AsyncData(userResponse.user!);
      } else {
        return const AsyncError(
            ClientError("user not logedin"), StackTrace.empty);
      }
    } catch (e, _) {
      return AsyncValue.error(e, StackTrace.empty);
    }
  }

  @override
  Future<AsyncValue<void>> signOut() async {
    try {
      await supabaseClient.auth.signOut();

      return const AsyncData(null);
    } catch (e) {
      return AsyncValue.error(e, StackTrace.empty);
    }
  }
}
