import 'package:flutter/material.dart';
import 'package:quiz_app/pages/splash_screen.dart';
import 'package:quiz_app/widget/quistions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = SplashScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = const Quistions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 54, 51, 57),
              Color.fromARGB(255, 24, 20, 27),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
