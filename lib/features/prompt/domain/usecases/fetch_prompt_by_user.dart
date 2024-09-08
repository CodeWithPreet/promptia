import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/core/core.dart';

import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';

class FetchPromptByUser {
  final PromptRemoteData _promptRemoteData;
  const FetchPromptByUser({required PromptRemoteData promptRemoteData})
      : _promptRemoteData = promptRemoteData;
  Future<AsyncValue<List<dynamic>>> call() async {
    try {
      logger.d('fetching user prompt');
      final result = await _promptRemoteData.fetchPromptByUser();
      return result;
    } catch (e) {
      logger.e(e);
      return AsyncValue.error(e, StackTrace.empty);
    }
  }
}
