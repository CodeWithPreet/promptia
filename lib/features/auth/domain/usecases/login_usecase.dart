import 'package:promptia/core/utils/utils.dart';
import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUsecase implements Usecase<AsyncValue<User>, LoginUsecaseParams> {
  final AuthRemoteData authRemoteData;
  const LoginUsecase({required this.authRemoteData});
  @override
  Future<AsyncValue<User>> call(LoginUsecaseParams params) async {
    final result = await authRemoteData.login(
      email: params.email,
      password: params.password,
    );
    return result;
  }
}

class LoginUsecaseParams {
  final String email;
  final String password;
  const LoginUsecaseParams({required this.email, required this.password});
}
