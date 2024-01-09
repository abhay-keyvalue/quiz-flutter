import "package:flutter/material.dart";
import "package:quiz/components/answerButton.dart";
import "package:quiz/question.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  void onTap() {}

  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    print(currentQuestion.text);

    return Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.purpleAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            )),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return (AnswerButton(answerText: item, onTap: onTap));
            }),
          ],
        ));
  }
}
