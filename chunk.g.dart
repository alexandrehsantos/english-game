// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chunk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChunkImpl _$$ChunkImplFromJson(Map<String, dynamic> json) => _$ChunkImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      category: json['category'] as String,
      level: (json['level'] as num).toInt(),
      audioUrl: json['audio_url'] as String,
      translationPt: json['translation_pt'] as String,
      usageExamples: (json['usage_examples'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ChunkImplToJson(_$ChunkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'category': instance.category,
      'level': instance.level,
      'audio_url': instance.audioUrl,
      'translation_pt': instance.translationPt,
      'usage_examples': instance.usageExamples,
      'tags': instance.tags,
      'created_at': instance.createdAt.toIso8601String(),
    };
