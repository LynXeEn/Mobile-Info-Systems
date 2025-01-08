import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/JokeModel.dart';

class JokesList extends StatelessWidget {
  final List<Joke> jokes;
  final Function(Joke) onFavoriteToggle;

  const JokesList({Key? key, required this.jokes, required this.onFavoriteToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jokes.length,
      separatorBuilder: (context, index) => const Divider(thickness: 1, color: Colors.grey),
      itemBuilder: (context, index) {
        final joke = jokes[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3.0,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            title: Text(
              joke.setup,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              joke.punchline,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: joke.isFavorite ? Colors.pinkAccent : Colors.grey,
                size: 24,
              ),
              onPressed: () {
                onFavoriteToggle(joke);
              },
            ),
          ),
        );
      },
    );
  }
}
