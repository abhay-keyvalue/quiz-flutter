import 'package:flutter/material.dart';
import "package:quiz/question.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.answerList, this.startQuiz, {super.key});

  final List<String> answerList;
  final void Function() startQuiz;

  int getTotalScore() {
    var correctAnswerCount = 0;
    for (var i = 0; i < answerList.length; i++) {
      if (answerList[i] == questions[i].answers[0]) {
        correctAnswerCount++;
      }
    }
    return correctAnswerCount;
  }

  void onRestart() {}

  @override
  Widget build(BuildContext context) {
    return (Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.purpleAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...answerList.asMap().entries.map((answer) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Q${answer.key}'),
                    Text(answer.value == questions[answer.key].answers[0]
                        ? 'true'
                        : 'false')
                  ],
                )),
            Text('Total Score${getTotalScore()}'),
            TextButton(onPressed: startQuiz, child: const Text('Restart'))
          ]),
        )));
  }
}
