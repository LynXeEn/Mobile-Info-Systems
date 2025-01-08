import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke_type.dart';
import 'package:jokes_app/services/api_services.dart';
import 'package:jokes_app/widgets/blurred_app_bar.dart';
import 'package:jokes_app/widgets/joke_type_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jovan Stojanovski 213137',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 167, 251),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '213137'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ApiService apiService;
  List<JokeTypeModel> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    fetchJokeTypes();
  }

  Future<void> fetchJokeTypes() async {
    final data = await apiService.fetchJokeCategories();
    setState(() {
      jokeTypes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: CustomBlurredAppBar(
        appBarTitle: widget.title,
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: jokeTypes.length,
          itemBuilder: (context, index) {
            return JokeTypeCard(
              type: jokeTypes[index].type,
            );
          },
        ),
      ),
    );
  }
}
