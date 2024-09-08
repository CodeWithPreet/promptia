// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      email: json['email'] as String,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'metadata': instance.metadata,
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
