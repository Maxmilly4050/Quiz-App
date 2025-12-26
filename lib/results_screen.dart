import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget{
   const ResultsScreen({super.key, required this.selectedAnswers, required this.restartQuiz});
   final List<String> selectedAnswers;
   final VoidCallback restartQuiz;
  
   List<Map<String, Object>> getSummaryData(dynamic selectedAnswers) {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
   }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(selectedAnswers);
    final int numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('You answered $numCorrectQuestions of $numTotalQuestions questions correctly!',
           textAlign: TextAlign.center,
           style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
           ),),
          SizedBox(height: 30,),
          QuestionsSummary(summaryData),
          SizedBox(height: 30,),
          TextButton.icon(
            onPressed: () {
              restartQuiz();
            },
            icon: Icon(Icons.refresh, color: Colors.white),
            label: Text('Restart Quiz!',
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,),
            ),
         ), 
        ],
    )
    );
  }
}