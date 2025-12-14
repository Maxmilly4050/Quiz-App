import 'package:flutter/material.dart';
import 'package:quiz_app/startscreen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
    
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen();
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
                Color.fromARGB(255, 62, 18, 104),
                Color.fromARGB(255, 52, 5, 66),
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
