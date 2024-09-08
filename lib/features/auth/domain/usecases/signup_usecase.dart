import 'package:promptia/core/core.dart';
import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupUsecase implements Usecase<AsyncValue<User>, SignupParams> {
  final AuthRemoteData authRemoteData;
  const SignupUsecase({required this.authRemoteData});
  @override
  Future<AsyncValue<User>> call(SignupParams params) async {
    final result = await authRemoteData.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
    return result;
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;
  const SignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
