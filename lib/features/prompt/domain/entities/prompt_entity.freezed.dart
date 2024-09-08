// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptEntity _$PromptEntityFromJson(Map<String, dynamic> json) {
  return _PromptEntity.fromJson(json);
}

/// @nodoc
mixin _$PromptEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Serializes this PromptEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptEntityCopyWith<PromptEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptEntityCopyWith<$Res> {
  factory $PromptEntityCopyWith(
          PromptEntity value, $Res Function(PromptEntity) then) =
      _$PromptEntityCopyWithImpl<$Res, PromptEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String prompt,
      String user_id,
      DateTime created_at,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PromptEntityCopyWithImpl<$Res, $Val extends PromptEntity>
    implements $PromptEntityCopyWith<$Res> {
  _$PromptEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? prompt = null,
    Object? user_id = null,
    Object? created_at = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromptEntityImplCopyWith<$Res>
    implements $PromptEntityCopyWith<$Res> {
  factory _$$PromptEntityImplCopyWith(
          _$PromptEntityImpl value, $Res Function(_$PromptEntityImpl) then) =
      __$$PromptEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String prompt,
      String user_id,
      DateTime created_at,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$PromptEntityImplCopyWithImpl<$Res>
    extends _$PromptEntityCopyWithImpl<$Res, _$PromptEntityImpl>
    implements _$$PromptEntityImplCopyWith<$Res> {
  __$$PromptEntityImplCopyWithImpl(
      _$PromptEntityImpl _value, $Res Function(_$PromptEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? prompt = null,
    Object? user_id = null,
    Object? created_at = null,
    Object? user = null,
  }) {
    return _then(_$PromptEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptEntityImpl implements _PromptEntity {
  _$PromptEntityImpl(
      {required this.id,
      required this.title,
      required this.prompt,
      required this.user_id,
      required this.created_at,
      required this.user});

  factory _$PromptEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String prompt;
  @override
  final String user_id;
  @override
  final DateTime created_at;
  @override
  final User user;

  @override
  String toString() {
    return 'PromptEntity(id: $id, title: $title, prompt: $prompt, user_id: $user_id, created_at: $created_at, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, prompt, user_id, created_at, user);

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptEntityImplCopyWith<_$PromptEntityImpl> get copyWith =>
      __$$PromptEntityImplCopyWithImpl<_$PromptEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptEntityImplToJson(
      this,
    );
  }
}

abstract class _PromptEntity implements PromptEntity {
  factory _PromptEntity(
      {required final int id,
      required final String title,
      required final String prompt,
      required final String user_id,
      required final DateTime created_at,
      required final User user}) = _$PromptEntityImpl;

  factory _PromptEntity.fromJson(Map<String, dynamic> json) =
      _$PromptEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get prompt;
  @override
  String get user_id;
  @override
  DateTime get created_at;
  @override
  User get user;

  /// Create a copy of PromptEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptEntityImplCopyWith<_$PromptEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
