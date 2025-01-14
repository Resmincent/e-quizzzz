import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_dt.dart';
import 'package:quiz_app/widget/answer_button.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelected});

  final void Function(String answer) onSelected;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelected(selectedAnswer);

    setState(() {
      // if (currentQuestionIndex < questions.length - 1) {
      //   currentQuestionIndex++;
      // } else {
      //   Navigator.of(context).pop();
      // }
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswer().map((answer) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
