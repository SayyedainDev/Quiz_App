import "package:adv_basic/start_screen.dart";
import "package:flutter/material.dart";
import "package:adv_basic/Answer_button.dart";
import "package:adv_basic/data/Questions.dart";
import "package:adv_basic/quiz.dart";
import "package:google_fonts/google_fonts.dart";

class Question extends StatefulWidget {
  Question({super.key, required this.onselected});
  final void Function(String answer) onselected;
  @override
  State<Question> createState() {
    return _Question();
  }
}

class _Question extends State<Question> {
  var Current_Question = 0;

  void AnswerQuestion(String answer) {
    widget.onselected(answer);
    setState(() {
      Current_Question++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[Current_Question];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.Text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 192, 177, 234),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getshuffeldAnswer().map((answer) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Answer(
                  answer: answer,
                  onTap: () {
                    AnswerQuestion(answer);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
