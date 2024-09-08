import 'package:promptia/core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String errorConverter(Object? error) {
  logger.i(error.runtimeType);

  if (error != null) {
    if (error is PostgrestException) {
      return error.message;
    }
    if (error is AuthException) {
      return error.message;
    }
  }
  return "unexpected error occured.";
}
