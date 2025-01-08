import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/JokeModel.dart';

class FavoriteJokesScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;

  const FavoriteJokesScreen({Key? key, required this.favoriteJokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        backgroundColor: Colors.greenAccent,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (favoriteJokes.isEmpty) {
      return const Center(
        child: Text('You haven\'t marked any jokes as favorite yet!'),
      );
    } else {
      return ListView.separated(
        itemCount: favoriteJokes.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return _buildJokeCard(favoriteJokes[index]);
        },
      );
    }
  }

  Widget _buildJokeCard(Joke joke) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              joke.punchline,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
