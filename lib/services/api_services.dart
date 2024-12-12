import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mis_lab_2/models/joke.dart';

class ApiService {
  static const String baseUrl = "https://official-joke-api.appspot.com";

  Future<List<String>> getJokesType() async {
    var response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      List<dynamic> types = json.decode(response.body);
      return types.cast<String>();
    }
    throw Exception('Failed to load joke types');
  }

  Future<List<Joke>> getJokesByType(String type) async {
    var response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      List<dynamic> jokes = json.decode(response.body);
      return jokes.map((joke) => Joke.fromJson(joke)).toList();
    }
    throw Exception('Failed to load jokes');
  }

  Future<Joke> getRandomJoke() async {
    var response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to load random joke');
  }
}
