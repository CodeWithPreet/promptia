import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class DeletePrompt {
  final PromptRemoteData _promptRemoteData;
  DeletePrompt({required PromptRemoteData promptRemoteData})
      : _promptRemoteData = promptRemoteData;
  Future<AsyncValue> call({required int id}) async {
    return await _promptRemoteData.deletePrompt(id: id);
  }
}
