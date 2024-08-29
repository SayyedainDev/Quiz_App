import "package:adv_basic/data/Questions.dart";
import "package:flutter/material.dart";
import "package:adv_basic/models/question_summary.dart";
import "package:google_fonts/google_fonts.dart";

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });
  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].Text,
        'Correct-Answer': questions[i].Answers[0],
        'user-answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final SummaryData = getSummaryData();
    final TotalQuestion = questions.length;
    final correctQuestion = SummaryData.where((data) {
      return data['user-answer'] == data['Correct-Answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You answer $correctQuestion out of $TotalQuestion question correctly!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 219, 172, 227),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData: SummaryData),
              TextButton.icon(
                  onPressed: onRestart,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 177, 84, 193)),
                  label: const Text('Restart Quiz '),
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ));
  }
}
