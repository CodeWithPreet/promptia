import 'package:promptia/core/config/supabase_config.dart';
import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';
import 'package:promptia/features/auth/domain/domain.dart';
import 'package:promptia/features/auth/domain/usecases/signout_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_providers.g.dart';

//client provider
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return SupabaseConfig.supabaseClient;
}

//AuthApiProvider
@riverpod
AuthRemoteData authApi(AuthApiRef ref) {
  final client = ref.read(supabaseClientProvider);
  return AuthRemoteDataImpl(supabaseClient: client);
}

//AuthRepoProvider
// @riverpod
// AuthRepo authRepo(AuthRepoRef ref) {
//   final res = ref.read(authApiProvider);
//   return AuthRepoImpl(res);
// }

//authStateProvider

// @riverpod
// Stream<AuthState> authState(AuthStateRef ref) async* {
//   yield* SupabaseConfig.supabaseClient.auth.onAuthStateChange.map(
//     (data) {
//       return data;
//     },
//   );
// }

@riverpod
LoginUsecase loginUsecase(LoginUsecaseRef ref) {
  return LoginUsecase(authRemoteData: ref.read(authApiProvider));
}

@riverpod
SignupUsecase signupUsecase(SignupUsecaseRef ref) {
  return SignupUsecase(authRemoteData: ref.read(authApiProvider));
}

@riverpod
GetCurrentUser getCurrentUser(GetCurrentUserRef ref) {
  return GetCurrentUser(authRemoteData: ref.read(authApiProvider));
}

@riverpod
LoadUser loadUser(LoadUserRef ref) {
  final authRemoteData = ref.read(authApiProvider);
  final value = LoadUser(authRemoteData: authRemoteData);
  return value;
}

@riverpod
SignoutUsecase signoutUsecase(SignoutUsecaseRef ref) {
  final authRemoteData = ref.read(authApiProvider);
  final value = SignoutUsecase(authRemoteData: authRemoteData);
  return value;
}
