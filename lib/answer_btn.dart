import 'package:flutter/material.dart';

class AnswerBtn extends StatelessWidget{
  const AnswerBtn(this.answerText,this.onTap,{super.key});

  final void Function()? onTap;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(            
            textStyle: TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          ),
          child: Text(answerText,
          textAlign: TextAlign.center,),
        );
}
}

