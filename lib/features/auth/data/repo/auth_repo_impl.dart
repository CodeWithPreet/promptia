// import 'package:fpdart/fpdart.dart';
// import 'package:promptia/core/constants/constants.dart';
// import 'package:promptia/core/core.dart';
// import 'package:promptia/features/auth/domain/repositories/auth_repo.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../data source/auth_remote_data.dart';

// class AuthRepoImpl implements AuthRepo {
//   final AuthRemoteData _authRemoteData;
//   AuthRepoImpl(this._authRemoteData);

//   @override
//   FEither<Failure, AsyncValue> login(
//       {required String email, required String password}) async {
//     try {
//       final result =
//           await _authRemoteData.login(email: email, password: password);

//       return right(AsyncValue.data(result));
//     } catch (e, stackTrace) {
//       return left(Failure.unexpected(e.toString(), stackTrace));
//     }
//   }

//   @override
//   FEither<Failure, AsyncValue> signUp(
//       {required String name,
//       required String email,
//       required String password}) async {
//     try {
//       final result = await _authRemoteData.signUp(
//           name: name, email: email, password: password);

//       return right(AsyncValue.data(result));
//     } catch (e, stackTrace) {
//       return left(Failure.unexpected(e.toString(), stackTrace));
//     }
//   }
// }
