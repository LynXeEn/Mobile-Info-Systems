import 'dart:convert';

import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/models/joke_type.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseEndpoint = "https://official-joke-api.appspot.com";

  ApiService();

  Future<List<JokeTypeModel>> fetchJokeCategories() async {
    final uri = Uri.parse('$baseEndpoint/types');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> parsedData = json.decode(response.body);
        return parsedData.map((item) => JokeTypeModel.fromJson(item)).toList();
      } else {
        throw Exception('Unable to fetch data');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<List<JokeModel>> fetchJokesByCategory(String category) async {
    final uri = Uri.parse('$baseEndpoint/jokes/$category/ten');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jokesResponse = json.decode(response.body);
        return jokesResponse.map((item) => JokeModel.fromJson(item)).toList();
      } else {
        throw Exception('Unable to fetch jokes');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<JokeModel> fetchRandomJokeOfTheDay() async {
    final uri = Uri.parse('$baseEndpoint/random_joke');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final dynamic jokeResponse = json.decode(response.body);
        return JokeModel.fromJson(jokeResponse);
      } else {
        throw Exception('Unable to fetch joke');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
