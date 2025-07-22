// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PuzzleImpl _$$PuzzleImplFromJson(Map<String, dynamic> json) => _$PuzzleImpl(
      id: json['id'] as String,
      chunkId: json['chunk_id'] as String,
      type: json['type'] as String,
      prompt: json['prompt'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctOptionIndex: (json['correct_option_index'] as num?)?.toInt(),
      timeLimitSec: (json['time_limit_sec'] as num).toInt(),
      hints:
          (json['hints'] as List<dynamic>?)?.map((e) => e as String).toList(),
      explanation: json['explanation'] as String?,
      difficulty: (json['difficulty'] as num).toInt(),
    );

Map<String, dynamic> _$$PuzzleImplToJson(_$PuzzleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chunk_id': instance.chunkId,
      'type': instance.type,
      'prompt': instance.prompt,
      'options': instance.options,
      'correct_option_index': instance.correctOptionIndex,
      'time_limit_sec': instance.timeLimitSec,
      'hints': instance.hints,
      'explanation': instance.explanation,
      'difficulty': instance.difficulty,
    };
