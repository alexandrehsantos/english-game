import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SrsManager {
  static const _key = 'srs_progress';

  Future<Map<String, UserProgress>> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return {};
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    final result = <String, UserProgress>{};
    for (final entry in decoded.entries) {
      final data = entry.value as Map<String, dynamic>;
      result[entry.key] = UserProgress(
        userId: data['userId'] as String,
        chunkId: data['chunkId'] as String,
        lastScore: data['lastScore'] as int,
        reviews: data['reviews'] as int,
        nextReviewAt: DateTime.parse(data['nextReviewAt'] as String),
        streakDays: data['streakDays'] as int,
      );
    }
    return result;
  }

  Future<void> saveProgress(Map<String, UserProgress> map) async {
    final prefs = await SharedPreferences.getInstance();
    final enc = <String, dynamic>{};
    map.forEach((key, value) {
      enc[key] = {
        'userId': value.userId,
        'chunkId': value.chunkId,
        'lastScore': value.lastScore,
        'reviews': value.reviews,
        'nextReviewAt': value.nextReviewAt.toIso8601String(),
        'streakDays': value.streakDays,
      };
    });
    await prefs.setString(_key, jsonEncode(enc));
  }

  Future<void> updateProgress(String userId, String chunkId, bool correct) async {
    final progress = await loadProgress();
    final key = '$userId:$chunkId';
    final current = progress[key] ?? UserProgress(
      userId: userId,
      chunkId: chunkId,
      lastScore: 0,
      reviews: 0,
      nextReviewAt: DateTime.now(),
      streakDays: 0,
    );

    if (correct) {
      current.reviews += 1;
      int interval;
      if (current.reviews == 1) {
        interval = 1;
      } else if (current.reviews == 2) {
        interval = 3;
      } else {
        interval = current.reviews * 2;
      }
      current.streakDays += 1;
      current.lastScore = 1;
      current.nextReviewAt = DateTime.now().add(Duration(days: interval));
    } else {
      current.reviews = 0;
      current.streakDays = 0;
      current.lastScore = 0;
      current.nextReviewAt = DateTime.now().add(const Duration(days: 1));
    }

    progress[key] = current;
    await saveProgress(progress);
  }

  Future<List<String>> chunksDue(String userId) async {
    final progress = await loadProgress();
    final now = DateTime.now();
    final due = <String>[];
    for (final entry in progress.entries) {
      if (entry.value.userId == userId && entry.value.nextReviewAt.isBefore(now)) {
        due.add(entry.value.chunkId);
      }
    }
    return due;
  }
}
