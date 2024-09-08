import 'package:promptia/features/prompt/data/data%20source/prompt_remote_data.dart';

class ListenChanges {
  final PromptRemoteData _promptRemoteData;
  ListenChanges({required PromptRemoteData promptRemoteData})
      : _promptRemoteData = promptRemoteData;

  Future<void> call() async {
    return await _promptRemoteData.litsenChanges();
  }
}
