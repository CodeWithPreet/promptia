import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';

class SignoutUsecase {
  final AuthRemoteData authRemoteData;
  const SignoutUsecase({required this.authRemoteData});

  Future<AsyncValue<void>> call() {
    final result = authRemoteData.signOut();
    return result;
  }
}
