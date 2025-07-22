import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Simple analytics service that sends events to Segment.
class AnalyticsService {
  AnalyticsService._internal();

  static final AnalyticsService instance = AnalyticsService._internal();

  static const String _writeKey = 'SEGMENT_WRITE_KEY'; // Replace with real key

  final http.Client _client = http.Client();

  Future<void> track(String event, Map<String, dynamic> properties) async {
    final body = jsonEncode({
      'event': event,
      'properties': properties,
      'anonymousId': 'anonymous_user',
    });

    final auth = base64Encode(utf8.encode('$_writeKey:'));

    try {
      final response = await _client.post(
        Uri.parse('https://api.segment.io/v1/track'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $auth',
        },
        body: body,
      );
      if (response.statusCode >= 400) {
        debugPrint('Failed to send analytics event: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Analytics error: $e');
    }
  }
}
