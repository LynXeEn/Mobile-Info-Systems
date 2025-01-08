import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/JokeModel.dart';
import 'package:laboratories_mis2/services/API_ServiceCall.dart';
import 'package:laboratories_mis2/screens/FavouriteJokes.dart';
import 'dart:convert';
import 'package:laboratories_mis2/widgets/Jokes.dart';

class JokesByTypeScreen extends StatefulWidget {
  final String type;

  const JokesByTypeScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<JokesByTypeScreen> createState() => _JokesByTypeScreenState();
}

class _JokesByTypeScreenState extends State<JokesByTypeScreen> {
  List<Joke> jokes = [];
  List<Joke> favoriteJokes = [];

  @override
  void initState() {
    super.initState();
    _fetchJokesByType();
  }

  void _fetchJokesByType() async {
    try {
      final response = await ApiService.getJokesByType(widget.type);
      final data = jsonDecode(response.body);
      setState(() {
        jokes = List<Joke>.from(data.map((item) => Joke.fromJson(item)));
      });
    } catch (e) {
      print("Error fetching jokes of type '${widget.type}': $e");
    }
  }

  void _toggleFavorite(Joke joke) {
    setState(() {
      joke.isFavorite = !joke.isFavorite;
      if (joke.isFavorite) {
        favoriteJokes.add(joke);
      } else {
        favoriteJokes.remove(joke);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes', style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.pink),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteJokesScreen(favoriteJokes: favoriteJokes),
                ),
              );
            },
          ),
        ],
      ),
      body: jokes.isEmpty
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurpleAccent,
        ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: JokesList(
          jokes: jokes,
          onFavoriteToggle: _toggleFavorite,
        ),
      ),
    );
  }
}
