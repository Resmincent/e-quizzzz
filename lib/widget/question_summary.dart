import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const green = Colors.green;
    const red = Colors.red;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            final isCorrect = item['user_answer'] == item['correct_answer'];
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 20,
                  decoration: BoxDecoration(
                    color: isCorrect ? green : red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    ((item['question_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['question'] as String,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['user_answer'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        item['correct_answer'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.green.withOpacity(0.8),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
