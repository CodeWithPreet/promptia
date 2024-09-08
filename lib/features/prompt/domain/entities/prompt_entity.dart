import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:promptia/features/auth/domain/entities/user_entity.dart';

part 'prompt_entity.freezed.dart';
part 'prompt_entity.g.dart';

@freezed
class PromptEntity with _$PromptEntity {
  factory PromptEntity({
    required int id,
    required String title,
    required String prompt,
    required String user_id,
    required DateTime created_at,
    required User user,
  }) = _PromptEntity;

  factory PromptEntity.fromJson(Map<String, dynamic> json) =>
      _$PromptEntityFromJson(json);
}
