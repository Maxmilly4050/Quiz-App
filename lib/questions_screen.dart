import 'package:flutter/material.dart';
import 'package:quiz_app/answer_btn.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}


class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionNumber = 0; 

  void answerQuestion(){
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionNumber];
    return Container(
      margin: EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.question,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 50,),
          ...currentQuestion.shuffledAnswers().map((answer) {
            return AnswerBtn(answer, answerQuestion
          );
          }
          )// SizedBox(height: 50,),
        ],
      ),
      ),
    );
  }
}
