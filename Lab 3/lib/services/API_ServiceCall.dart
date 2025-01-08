import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'https://official-joke-api.appspot.com';

  static Future<http.Response> getJokeTypes() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/types'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load joke types. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching joke types: $e');
    }
  }

  static Future<http.Response> getJokesByType(String type) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/jokes/$type/ten'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load jokes by type. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching jokes by type: $e');
    }
  }

  static Future<http.Response> getRandomJoke() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/random_joke'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load a random joke. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching a random joke: $e');
    }
  }
}
