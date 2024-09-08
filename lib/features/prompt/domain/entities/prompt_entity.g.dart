// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptEntityImpl _$$PromptEntityImplFromJson(Map<String, dynamic> json) =>
    _$PromptEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      prompt: json['prompt'] as String,
      user_id: json['user_id'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PromptEntityImplToJson(_$PromptEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prompt': instance.prompt,
      'user_id': instance.user_id,
      'created_at': instance.created_at.toIso8601String(),
      'user': instance.user,
    };
