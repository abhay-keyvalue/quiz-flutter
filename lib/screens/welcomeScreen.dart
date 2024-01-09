import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black, Colors.purpleAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: const Text(
              'Learn flutter the fun way!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right),
              label: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ))
        ],
      )),
    );
  }
}
