import 'package:flutter/material.dart';
import 'package:quiz/screens/QuestionScreen.dart';
import 'package:quiz/screens/resultScreen.dart';
import 'package:quiz/screens/welcomeScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = WelcomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(showResultScreen);
    });
  }

  void showResultScreen(answerList) {
    setState(() {
      activeScreen = ResultScreen(answerList, switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
