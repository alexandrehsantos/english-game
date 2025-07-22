// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chunk _$ChunkFromJson(Map<String, dynamic> json) {
  return _Chunk.fromJson(json);
}

/// @nodoc
mixin _$Chunk {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  String get translationPt => throw _privateConstructorUsedError;
  List<String> get usageExamples => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Chunk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChunkCopyWith<Chunk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChunkCopyWith<$Res> {
  factory $ChunkCopyWith(Chunk value, $Res Function(Chunk) then) =
      _$ChunkCopyWithImpl<$Res, Chunk>;
  @useResult
  $Res call(
      {String id,
      String text,
      String category,
      int level,
      String audioUrl,
      String translationPt,
      List<String> usageExamples,
      List<String> tags,
      DateTime createdAt});
}

/// @nodoc
class _$ChunkCopyWithImpl<$Res, $Val extends Chunk>
    implements $ChunkCopyWith<$Res> {
  _$ChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? category = null,
    Object? level = null,
    Object? audioUrl = null,
    Object? translationPt = null,
    Object? usageExamples = null,
    Object? tags = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      translationPt: null == translationPt
          ? _value.translationPt
          : translationPt // ignore: cast_nullable_to_non_nullable
              as String,
      usageExamples: null == usageExamples
          ? _value.usageExamples
          : usageExamples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChunkImplCopyWith<$Res> implements $ChunkCopyWith<$Res> {
  factory _$$ChunkImplCopyWith(
          _$ChunkImpl value, $Res Function(_$ChunkImpl) then) =
      __$$ChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String category,
      int level,
      String audioUrl,
      String translationPt,
      List<String> usageExamples,
      List<String> tags,
      DateTime createdAt});
}

/// @nodoc
class __$$ChunkImplCopyWithImpl<$Res>
    extends _$ChunkCopyWithImpl<$Res, _$ChunkImpl>
    implements _$$ChunkImplCopyWith<$Res> {
  __$$ChunkImplCopyWithImpl(
      _$ChunkImpl _value, $Res Function(_$ChunkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? category = null,
    Object? level = null,
    Object? audioUrl = null,
    Object? translationPt = null,
    Object? usageExamples = null,
    Object? tags = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChunkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      translationPt: null == translationPt
          ? _value.translationPt
          : translationPt // ignore: cast_nullable_to_non_nullable
              as String,
      usageExamples: null == usageExamples
          ? _value._usageExamples
          : usageExamples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ChunkImpl implements _Chunk {
  const _$ChunkImpl(
      {required this.id,
      required this.text,
      required this.category,
      required this.level,
      required this.audioUrl,
      required this.translationPt,
      required final List<String> usageExamples,
      required final List<String> tags,
      required this.createdAt})
      : _usageExamples = usageExamples,
        _tags = tags;

  factory _$ChunkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChunkImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String category;
  @override
  final int level;
  @override
  final String audioUrl;
  @override
  final String translationPt;
  final List<String> _usageExamples;
  @override
  List<String> get usageExamples {
    if (_usageExamples is EqualUnmodifiableListView) return _usageExamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usageExamples);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Chunk(id: $id, text: $text, category: $category, level: $level, audioUrl: $audioUrl, translationPt: $translationPt, usageExamples: $usageExamples, tags: $tags, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChunkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.translationPt, translationPt) ||
                other.translationPt == translationPt) &&
            const DeepCollectionEquality()
                .equals(other._usageExamples, _usageExamples) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      category,
      level,
      audioUrl,
      translationPt,
      const DeepCollectionEquality().hash(_usageExamples),
      const DeepCollectionEquality().hash(_tags),
      createdAt);

  /// Create a copy of Chunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChunkImplCopyWith<_$ChunkImpl> get copyWith =>
      __$$ChunkImplCopyWithImpl<_$ChunkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChunkImplToJson(
      this,
    );
  }
}

abstract class _Chunk implements Chunk {
  const factory _Chunk(
      {required final String id,
      required final String text,
      required final String category,
      required final int level,
      required final String audioUrl,
      required final String translationPt,
      required final List<String> usageExamples,
      required final List<String> tags,
      required final DateTime createdAt}) = _$ChunkImpl;

  factory _Chunk.fromJson(Map<String, dynamic> json) = _$ChunkImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get category;
  @override
  int get level;
  @override
  String get audioUrl;
  @override
  String get translationPt;
  @override
  List<String> get usageExamples;
  @override
  List<String> get tags;
  @override
  DateTime get createdAt;

  /// Create a copy of Chunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChunkImplCopyWith<_$ChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
