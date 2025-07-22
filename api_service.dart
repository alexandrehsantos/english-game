import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chunk.dart';

class ApiService {
  final String _baseUrl = "https://api.yourapp.com/api"; // Replace with your actual API base URL

  Future<List<Chunk>> getChunks({int? level, String? category}) async {
    final queryParameters = {
      if (level != null) 'level': level.toString(),
      if (category != null) 'category': category,
    };

    final uri = Uri.parse('$_baseUrl/chunks').replace(queryParameters: queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Chunk.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load chunks');
    }
  }
}