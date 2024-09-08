import 'package:promptia/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class PromptRemoteData {
  Future<AsyncValue<void>> addPrompt({required Map<String, dynamic> body});
  Future<AsyncValue<List<dynamic>>> fetchPrompt();
  Future<AsyncValue<List<dynamic>>> fetchPromptByUser();
  Future<AsyncValue<void>> deletePrompt({required int id});
  Future<void> litsenChanges();
}

class PromptRemoteDataImpl implements PromptRemoteData {
  final SupabaseClient supabaseClient;
  const PromptRemoteDataImpl({required this.supabaseClient});

  @override
  Future<AsyncValue> addPrompt({required Map<String, dynamic> body}) async {
    try {
      final result = await supabaseClient.from('prompt').insert(
            body,
          );

      return AsyncValue.data(result);
    } catch (e) {
      return AsyncValue.error(e, StackTrace.empty);
    }
  }

  @override
  Future<AsyncValue<List>> fetchPrompt() async {
    try {
      logger.d('fetching prompt');
      logger.i(".....");
      final result = await supabaseClient.from('prompt').select('''
id,title,prompt,user_id,created_at,user: user_id (email,metadata)''').order('id', ascending: false);

      return AsyncValue.data(result);
    } catch (e) {
      return AsyncValue.error(e, StackTrace.empty);
    }
  }

  @override
  Future<AsyncValue> deletePrompt({required int id}) async {
    try {
      logger.d('deleting prompt');
      final result =
          await supabaseClient.from('prompt').delete().match({'id': id});
      logger.d(result);
      return AsyncValue.data(result);
    } catch (e) {
      logger.e(e);
      return AsyncValue.error(e, StackTrace.empty);
    }
  }

  @override
  Future<AsyncValue<List>> fetchPromptByUser() async {
    try {
      logger.d('fetching user prompt');
      final result = await supabaseClient.from('prompt').select(
          '''id,title,prompt,user_id,created_at,user: user_id (email,metadata)''').match({
        "user_id": supabaseClient.auth.currentUser!.id
      }).order('id', ascending: false);
      return AsyncValue.data(result);
    } catch (e) {
      logger.e(e);
      return AsyncValue.error(e, StackTrace.empty);
    }
  }

  @override
  Future<void> litsenChanges() async {
    final result = supabaseClient
        .channel('public:prompt')
        .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'prompt',
            callback: (payload) {
              logger.d('Insert event received: ${payload.toString()}');
            })
        .onPostgresChanges(
            event: PostgresChangeEvent.delete,
            schema: 'public',
            table: 'prompt',
            callback: (payload) {
              logger.d('Delete event received: ${payload.toString()}');
            })
        .subscribe();

    result;
  }
}
