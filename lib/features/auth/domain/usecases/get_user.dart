import 'package:promptia/features/auth/data/data%20source/auth_remote_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetCurrentUser {
  final AuthRemoteData authRemoteData;
  const GetCurrentUser({required this.authRemoteData});

  User? call() {
    return authRemoteData.getCurrentUser();
  }
}
