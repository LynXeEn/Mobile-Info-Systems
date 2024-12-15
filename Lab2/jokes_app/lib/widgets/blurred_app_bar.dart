import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jokes_app/screens/joke_screen_day.dart';

class CustomBlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomBlurredAppBar({
    super.key,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey.withOpacity(0.4),
          elevation: 6,
          title: Text(
            appBarTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.casino, color: Colors.yellowAccent),
              iconSize: 40,
              tooltip: 'Get a Random Joke',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokeOfTheDayScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
