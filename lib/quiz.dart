import "package:adv_basic/data/Questions.dart";
import "package:adv_basic/question.dart";
import "package:flutter/material.dart";
import "package:adv_basic/start_screen.dart";
import "package:adv_basic/models/quiz_question.dart";
import "package:adv_basic/result_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var Active_screen = "Start";

  List<String> SelectedAnswer = [];

  void chooseAnswer(String CAnswer) {
    SelectedAnswer.add(CAnswer);

    if (SelectedAnswer.length == questions.length) {
      setState(() {
        Active_screen = "result-screen";
      });
    }
  }

  void Switch_Screen() {
    setState(() {
      Active_screen = "Quiz";
    });
  }

  void restartQuiz() {
    setState(() {
      SelectedAnswer = [];
      Active_screen = 'Quiz';
    });
  }

  @override
  Widget build(context) {
    Widget A_Screen = StartScreen(Switch_Screen);
    if (Active_screen == 'Quiz') {
      A_Screen = Question(onselected: chooseAnswer);
    }
    if (Active_screen == "result-screen") {
      A_Screen = ResultScreen(
        chosenAnswer: SelectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 146, 52, 163),
            Color.fromARGB(255, 44, 15, 48)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: A_Screen),
    ));
  }
}
