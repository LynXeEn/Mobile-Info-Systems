import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/JokeModel.dart';
import 'package:laboratories_mis2/services/API_ServiceCall.dart';
import 'dart:convert';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({Key? key}) : super(key: key);

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  Joke? randomJoke;

  @override
  void initState() {
    super.initState();
    _fetchRandomJoke();
  }

  void _fetchRandomJoke() async {
    try {
      final response = await ApiService.getRandomJoke();
      final data = jsonDecode(response.body);
      setState(() {
        randomJoke = Joke.fromJson(data);
      });
    } catch (e) {
      print("Error fetching random joke: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Joke',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        elevation: 4,
      ),
      body: randomJoke == null
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.indigoAccent,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  randomJoke!.setup,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  randomJoke!.punchline,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
