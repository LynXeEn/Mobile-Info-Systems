import 'package:flutter/material.dart';
import 'package:jokes_app/screens/joke_screen_type.dart';

class JokeTypeCard extends StatelessWidget {
  final String type;

  const JokeTypeCard({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JokesWithTypeScreen(
              type: type,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: const Color(0xFF3B4A56),
        elevation: 8,
        shadowColor: Colors.blueGrey.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  type,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
