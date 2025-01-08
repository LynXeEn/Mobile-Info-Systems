import 'package:flutter/material.dart';
import 'package:laboratories_mis2/screens/RandomJoke_Screen.dart';
import 'dart:convert';
import 'package:laboratories_mis2/services/API_ServiceCall.dart';
import 'package:laboratories_mis2/widgets/List_JokeTypes.dart';

class JokeTypesScreen extends StatefulWidget {
  const JokeTypesScreen({Key? key}) : super(key: key);

  @override
  State<JokeTypesScreen> createState() => _JokeTypesScreenState();
}

class _JokeTypesScreenState extends State<JokeTypesScreen> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    _fetchJokeTypes();
  }

  void _fetchJokeTypes() async {
    try {
      final response = await ApiService.getJokeTypes();
      final data = jsonDecode(response.body);
      setState(() {
        jokeTypes = List<String>.from(data);
      });
    } catch (e) {
      print("Error loading joke types: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joke Categories - Jovan Stojanovski 213137',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shuffle,
              size: 36,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomJokeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.blueGrey,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: JokeTypesList(jokeTypes: jokeTypes),
      ),
    );
  }
}
