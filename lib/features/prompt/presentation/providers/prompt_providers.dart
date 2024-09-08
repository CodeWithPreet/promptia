import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';
import 'package:promptia/features/prompt/domain/usecases/add_prompt.dart';
import 'package:promptia/features/prompt/domain/usecases/delete_prompt.dart';
import 'package:promptia/features/prompt/domain/usecases/fetch_prompt.dart';
import 'package:promptia/features/prompt/domain/usecases/fetch_prompt_by_user.dart';
import 'package:promptia/features/prompt/domain/usecases/listen_changes.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/auth.dart';
part 'prompt_providers.g.dart';

@riverpod
PromptRemoteData promptRemoteData(PromptRemoteDataRef ref) {
  final supabaseClient = ref.read(supabaseClientProvider);
  return PromptRemoteDataImpl(supabaseClient: supabaseClient);
}

@riverpod
AddPrompt addPrompt(AddPromptRef ref) {
  return AddPrompt(promptRemoteData: ref.read(promptRemoteDataProvider));
}

@riverpod
FetchPrompt fetchPrompt(FetchPromptRef ref) {
  return FetchPrompt(promptRemoteData: ref.read(promptRemoteDataProvider));
}

@riverpod
DeletePrompt deletePrompt(DeletePromptRef ref) {
  return DeletePrompt(promptRemoteData: ref.read(promptRemoteDataProvider));
}

@riverpod
FetchPromptByUser fetchPromptByUser(FetchPromptByUserRef ref) {
  return FetchPromptByUser(
    promptRemoteData: ref.read(promptRemoteDataProvider),
  );
}

@riverpod
ListenChanges listenChanges(ListenChangesRef ref) {
  return ListenChanges(promptRemoteData: ref.read(promptRemoteDataProvider));
}
