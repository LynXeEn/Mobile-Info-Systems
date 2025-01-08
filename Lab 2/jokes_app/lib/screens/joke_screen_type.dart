import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/services/api_services.dart';
import 'package:jokes_app/widgets/blurred_app_bar.dart';
import 'package:jokes_app/widgets/joke_card.dart';

class JokesWithTypeScreen extends StatefulWidget {
  const JokesWithTypeScreen({super.key, required this.type});

  final String type;

  @override
  State<JokesWithTypeScreen> createState() => _JokesWithTypeScreenState();
}

class _JokesWithTypeScreenState extends State<JokesWithTypeScreen> {
  late String jokeType;
  late ApiService apiService;
  List<JokeModel> jokeList = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    jokeType = widget.type;
    _loadJokes();
  }

  Future<void> _loadJokes() async {
    final fetchedJokes = await apiService.fetchJokesByCategory(jokeType);
    setState(() {
      jokeList = fetchedJokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: CustomBlurredAppBar(
        appBarTitle: jokeType,
      ),
      body: jokeList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokeList.length,
        itemBuilder: (context, index) {
          return JokeDisplayCard(
            jokeType: jokeList[index].type,
            jokeId: jokeList[index].id,
            jokeSetup: jokeList[index].setup,
            jokePunchline: jokeList[index].punchline,
          );
        },
      ),
    );
  }
}
