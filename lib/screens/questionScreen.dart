import "package:flutter/material.dart";
import "package:quiz/components/answerButton.dart";
import "package:quiz/question.dart";
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.showResultScreen, {super.key});
  final void Function(List<String>) showResultScreen;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> answerList = [];
  var currentQuestionIndex = 0;
  void answerQuestion(answer) {
    setState(() {
      answerList.add(answer);
      if (questions.length == answerList.length) {
        widget.showResultScreen(answerList);
      } else {
        currentQuestionIndex = currentQuestionIndex + 1;
      }
    });
  }

  @override
  Widget build(context) {
    print(answerList);
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
              questions[currentQuestionIndex].text,
              style: GoogleFonts.lato(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 24)),
            )),
            const SizedBox(height: 30),
            ...questions[currentQuestionIndex].getShuffledAnswers().map((item) {
              return (AnswerButton(
                  answerText: item,
                  onTap: () {
                    answerQuestion(item);
                  }));
            }),
          ],
        ));
  }
}
