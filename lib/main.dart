import 'package:flutter/material.dart';
import 'package:project1/Game.dart';
import 'Welcome.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/game': (context) => GamePage(),
      },
    );
  }
}
