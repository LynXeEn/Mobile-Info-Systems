import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/services/api_services.dart';
import 'package:jokes_app/widgets/blurred_app_bar.dart';
import 'package:jokes_app/widgets/joke_card.dart';

class JokeOfTheDayScreen extends StatefulWidget {
  const JokeOfTheDayScreen({Key? key}) : super(key: key);

  @override
  _JokeOfTheDayScreenState createState() => _JokeOfTheDayScreenState();
}

class _JokeOfTheDayScreenState extends State<JokeOfTheDayScreen> {
  late ApiService apiService;
  JokeModel? randomJoke;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _loadJoke();
  }

  Future<void> _loadJoke() async {
    final jokeData = await apiService.fetchRandomJokeOfTheDay();
    setState(() {
      randomJoke = jokeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomBlurredAppBar(
        appBarTitle: "Today's Laugh",
      ),
      body: randomJoke == null
          ? const Center(child: CircularProgressIndicator())
          : JokeDisplayCard(
        jokeType: randomJoke!.type,
        jokeId: randomJoke!.id,
        jokeSetup: randomJoke!.setup,
        jokePunchline: randomJoke!.punchline,
      ),
    );
  }
}
