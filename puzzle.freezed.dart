// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Puzzle _$PuzzleFromJson(Map<String, dynamic> json) {
  return _Puzzle.fromJson(json);
}

/// @nodoc
mixin _$Puzzle {
  String get id => throw _privateConstructorUsedError;
  String get chunkId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;
  int? get correctOptionIndex => throw _privateConstructorUsedError;
  int get timeLimitSec => throw _privateConstructorUsedError;
  List<String>? get hints => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;

  /// Serializes this Puzzle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Puzzle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PuzzleCopyWith<Puzzle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuzzleCopyWith<$Res> {
  factory $PuzzleCopyWith(Puzzle value, $Res Function(Puzzle) then) =
      _$PuzzleCopyWithImpl<$Res, Puzzle>;
  @useResult
  $Res call(
      {String id,
      String chunkId,
      String type,
      String prompt,
      List<String>? options,
      int? correctOptionIndex,
      int timeLimitSec,
      List<String>? hints,
      String? explanation,
      int difficulty});
}

/// @nodoc
class _$PuzzleCopyWithImpl<$Res, $Val extends Puzzle>
    implements $PuzzleCopyWith<$Res> {
  _$PuzzleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Puzzle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chunkId = null,
    Object? type = null,
    Object? prompt = null,
    Object? options = freezed,
    Object? correctOptionIndex = freezed,
    Object? timeLimitSec = null,
    Object? hints = freezed,
    Object? explanation = freezed,
    Object? difficulty = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correctOptionIndex: freezed == correctOptionIndex
          ? _value.correctOptionIndex
          : correctOptionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      timeLimitSec: null == timeLimitSec
          ? _value.timeLimitSec
          : timeLimitSec // ignore: cast_nullable_to_non_nullable
              as int,
      hints: freezed == hints
          ? _value.hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PuzzleImplCopyWith<$Res> implements $PuzzleCopyWith<$Res> {
  factory _$$PuzzleImplCopyWith(
          _$PuzzleImpl value, $Res Function(_$PuzzleImpl) then) =
      __$$PuzzleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String chunkId,
      String type,
      String prompt,
      List<String>? options,
      int? correctOptionIndex,
      int timeLimitSec,
      List<String>? hints,
      String? explanation,
      int difficulty});
}

/// @nodoc
class __$$PuzzleImplCopyWithImpl<$Res>
    extends _$PuzzleCopyWithImpl<$Res, _$PuzzleImpl>
    implements _$$PuzzleImplCopyWith<$Res> {
  __$$PuzzleImplCopyWithImpl(
      _$PuzzleImpl _value, $Res Function(_$PuzzleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Puzzle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chunkId = null,
    Object? type = null,
    Object? prompt = null,
    Object? options = freezed,
    Object? correctOptionIndex = freezed,
    Object? timeLimitSec = null,
    Object? hints = freezed,
    Object? explanation = freezed,
    Object? difficulty = null,
  }) {
    return _then(_$PuzzleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correctOptionIndex: freezed == correctOptionIndex
          ? _value.correctOptionIndex
          : correctOptionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      timeLimitSec: null == timeLimitSec
          ? _value.timeLimitSec
          : timeLimitSec // ignore: cast_nullable_to_non_nullable
              as int,
      hints: freezed == hints
          ? _value._hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PuzzleImpl implements _Puzzle {
  const _$PuzzleImpl(
      {required this.id,
      required this.chunkId,
      required this.type,
      required this.prompt,
      final List<String>? options,
      this.correctOptionIndex,
      required this.timeLimitSec,
      final List<String>? hints,
      this.explanation,
      required this.difficulty})
      : _options = options,
        _hints = hints;

  factory _$PuzzleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PuzzleImplFromJson(json);

  @override
  final String id;
  @override
  final String chunkId;
  @override
  final String type;
  @override
  final String prompt;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? correctOptionIndex;
  @override
  final int timeLimitSec;
  final List<String>? _hints;
  @override
  List<String>? get hints {
    final value = _hints;
    if (value == null) return null;
    if (_hints is EqualUnmodifiableListView) return _hints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? explanation;
  @override
  final int difficulty;

  @override
  String toString() {
    return 'Puzzle(id: $id, chunkId: $chunkId, type: $type, prompt: $prompt, options: $options, correctOptionIndex: $correctOptionIndex, timeLimitSec: $timeLimitSec, hints: $hints, explanation: $explanation, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuzzleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOptionIndex, correctOptionIndex) ||
                other.correctOptionIndex == correctOptionIndex) &&
            (identical(other.timeLimitSec, timeLimitSec) ||
                other.timeLimitSec == timeLimitSec) &&
            const DeepCollectionEquality().equals(other._hints, _hints) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chunkId,
      type,
      prompt,
      const DeepCollectionEquality().hash(_options),
      correctOptionIndex,
      timeLimitSec,
      const DeepCollectionEquality().hash(_hints),
      explanation,
      difficulty);

  /// Create a copy of Puzzle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PuzzleImplCopyWith<_$PuzzleImpl> get copyWith =>
      __$$PuzzleImplCopyWithImpl<_$PuzzleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PuzzleImplToJson(
      this,
    );
  }
}

abstract class _Puzzle implements Puzzle {
  const factory _Puzzle(
      {required final String id,
      required final String chunkId,
      required final String type,
      required final String prompt,
      final List<String>? options,
      final int? correctOptionIndex,
      required final int timeLimitSec,
      final List<String>? hints,
      final String? explanation,
      required final int difficulty}) = _$PuzzleImpl;

  factory _Puzzle.fromJson(Map<String, dynamic> json) = _$PuzzleImpl.fromJson;

  @override
  String get id;
  @override
  String get chunkId;
  @override
  String get type;
  @override
  String get prompt;
  @override
  List<String>? get options;
  @override
  int? get correctOptionIndex;
  @override
  int get timeLimitSec;
  @override
  List<String>? get hints;
  @override
  String? get explanation;
  @override
  int get difficulty;

  /// Create a copy of Puzzle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PuzzleImplCopyWith<_$PuzzleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
