import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';

class AddPrompt {
  final PromptRemoteData _promptRemoteData;
  const AddPrompt({required PromptRemoteData promptRemoteData})
      : _promptRemoteData = promptRemoteData;

  Future<AsyncValue<void>> call({body}) async {
    return await _promptRemoteData.addPrompt(body: body);
  }
}
