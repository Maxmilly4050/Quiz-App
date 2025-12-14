import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Questions Screen',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 50,),
        ElevatedButton(
          onPressed: () {
            // Navigate to another screen or perform an action
          },
          child: Text('Next Question'),
        ),
      ],
    ),
    );
  }
}
