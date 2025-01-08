import 'package:flutter/material.dart';

class JokeDisplayCard extends StatelessWidget {
  final String? jokeType;
  final String? jokeSetup;
  final String? jokePunchline;
  final int? jokeId;

  const JokeDisplayCard({
    super.key,
    required this.jokeType,
    required this.jokeSetup,
    required this.jokePunchline,
    required this.jokeId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // If you want to handle tap actions (e.g., show more details)
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        tileColor: const Color(0xFF2A2E36),
        title: Text(
          jokeSetup ?? 'No Setup',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            jokePunchline ?? 'No Punchline',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
