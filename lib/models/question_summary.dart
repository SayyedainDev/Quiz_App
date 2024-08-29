import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class QuestionSummary extends StatelessWidget {
  QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['question-index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 24),
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Correct Answer: ${data['Correct-Answer'] as String}',
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(131, 171, 251, 174),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Your Answer: ${data['user-answer'] as String}',
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(132, 240, 168, 168),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
