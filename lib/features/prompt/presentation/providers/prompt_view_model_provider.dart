import 'package:promptia/features/prompt/domain/entities/prompt_entity.dart';

import 'package:promptia/features/prompt/presentation/providers/prompt_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../auth/auth.dart';

part 'prompt_view_model_provider.g.dart';

@riverpod
class PromptViewModelProvider extends _$PromptViewModelProvider {
  @override
  AsyncValue<List<PromptEntity>> build() {
    logger.i('PromptViewModel initialized');

    fetchPromptByUser();
    logger.i('Listening to changes');
    listenChanges();

    return const AsyncLoading();
  }

  Future<AsyncValue<void>> addPrompt(
      {required String title, required String prompt}) async {
    logger.i('Adding prompt');
    Map<String, dynamic> body = {
      'title': title,
      'prompt': prompt,
      'user_id': ref.watch(authViewModelProvider).value?.id,
    };
    final result = await ref.read(addPromptProvider).call(body: body);
    return result;
  }

  Future<AsyncValue> deletePrompt({required int id}) async {
    logger.i('Deleting prompt');
    final result = await ref.read(deletePromptProvider).call(id: id);
    return result;
  }

  Future<AsyncValue<List<PromptEntity>>> fetchPromptByUser() async {
    try {
      logger.i('Fetching user prompt');
      final AsyncValue<List<dynamic>> result =
          await ref.read(fetchPromptByUserProvider).call();
      if (result.hasValue) {
        final List<dynamic> dataList = result.value!;
        final promptList = [
          for (var prompt in dataList) PromptEntity.fromJson(prompt)
        ];
        logger.d(dataList);
        state = promptList.isNotEmpty
            ? AsyncData(promptList)
            : const AsyncError('No prompt found', StackTrace.empty);
        return state;
      }
    } catch (e) {
      logger.e(e);
      return AsyncError(e.toString(), StackTrace.empty);
    }

    // Add a return statement at the end
    return const AsyncLoading();
  }

  Future<void> listenChanges() async {
    logger.i('Listening to changes fetchPromptByUser');
    ref.read(listenChangesProvider).call();
  }
}

@riverpod
class FetchAllPrompt extends _$FetchAllPrompt {
  @override
  AsyncValue<List<PromptEntity>> build() {
    logger.i('FetchAllPrompt initialized');
    fetchPrompt();
    logger.i('Listening to changes fetchAllPrompt');
    listenChanges();
    return const AsyncLoading();
  }

  Future<void> listenChanges() async {
    logger.i('Listening to changes fetchAllPrompt');
    ref.read(listenChangesProvider).call();
  }

  Future<AsyncValue<List<PromptEntity>>> fetchPrompt() async {
    try {
      logger.i('Fetching prompt');

      final result = await ref.read(fetchPromptProvider).call();
      if (result.hasValue) {
        final List<dynamic> dataList = result.value!;
        final promptList = [
          for (var prompt in dataList) PromptEntity.fromJson(prompt)
        ];
        logger.d(dataList);
        state = promptList.isNotEmpty
            ? AsyncData(promptList)
            : const AsyncError('No prompt found', StackTrace.empty);
      }
    } catch (e) {
      logger.e(e);
      return AsyncError(e.toString(), StackTrace.empty);
    }

    // Add a return statement at the end
    return const AsyncLoading();
  }
}
