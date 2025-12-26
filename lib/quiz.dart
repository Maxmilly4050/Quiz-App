import 'package:flutter/material.dart';
import 'package:quiz_app/startscreen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }

  
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final selectedAnswers = <String>[];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length ==  questions.length){
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers: selectedAnswers,restartQuiz: restartQuiz,);
        // selectedAnswers.clear();
      });
    } 
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
    
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState((){
      activeScreen = StartScreen(switchScreen);
      selectedAnswers.clear();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 52, 5, 66),
        ), 
      
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App', style: TextStyle(color: Colors.white),)
        ),  
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 197, 147, 243),
                Color.fromARGB(255, 119, 44, 141),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
      ),
    ),
    );  } 

  }
