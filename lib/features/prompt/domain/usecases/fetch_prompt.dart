import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';

class FetchPrompt {
  final PromptRemoteData _promptRemoteData;
  const FetchPrompt({required PromptRemoteData promptRemoteData})
      : _promptRemoteData = promptRemoteData;

  Future<AsyncValue<List<dynamic>>> call() async {
    return await _promptRemoteData.fetchPrompt();
  }
}
