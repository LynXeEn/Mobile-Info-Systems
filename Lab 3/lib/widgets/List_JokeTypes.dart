import 'package:flutter/material.dart';
import 'package:laboratories_mis2/screens/JokesByType.dart';

class JokeTypesList extends StatelessWidget {
  final List<String> jokeTypes;

  const JokeTypesList({Key? key, required this.jokeTypes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jokeTypes.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey, thickness: 1),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JokesByTypeScreen(type: jokeTypes[index]),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Container(
              height: 80,
              alignment: Alignment.center,
              child: Text(
                jokeTypes[index].toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
