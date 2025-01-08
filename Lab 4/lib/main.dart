import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/EventProvider.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExamProvider(),
      child: MaterialApp(
        title: 'Student Exam Planner',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 2,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
