import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle.freezed.dart';
part 'puzzle.g.dart';

@freezed
class Puzzle with _$Puzzle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Puzzle({
    required String id,
    required String chunkId,
    required String type,
    required String prompt,
    List<String>? options,
    int? correctOptionIndex,
    required int timeLimitSec,
    List<String>? hints,
    String? explanation,
    required int difficulty,
  }) = _Puzzle;

  factory Puzzle.fromJson(Map<String, dynamic> json) => _$PuzzleFromJson(json);
}