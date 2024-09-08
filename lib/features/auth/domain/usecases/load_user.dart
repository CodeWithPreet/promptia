import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class LoadUser {
  final AuthRemoteData authRemoteData;

  const LoadUser({required this.authRemoteData});

  Future<AsyncValue<User>> call() {
    final result = authRemoteData.loadUser();
    return result;
  }
}
