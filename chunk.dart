import 'package:freezed_annotation/freezed_annotation.dart';

part 'chunk.freezed.dart';
part 'chunk.g.dart';

@freezed
class Chunk with _$Chunk {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Chunk({
    required String id,
    required String text,
    required String category,
    required int level,
    required String audioUrl,
    required String translationPt,
    required List<String> usageExamples,
    required List<String> tags,
    required DateTime createdAt,
  }) = _Chunk;

  factory Chunk.fromJson(Map<String, dynamic> json) => _$ChunkFromJson(json);
}